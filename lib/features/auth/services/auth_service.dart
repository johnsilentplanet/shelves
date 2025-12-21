import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../data/datasources/remote/firestore_service.dart';
import '../../../data/models/user_profile.dart';

/// Service for handling authentication operations.
class AuthService {
  AuthService({
    required FirebaseAuth firebaseAuth,
    required FirestoreService firestoreService,
    GoogleSignIn? googleSignIn,
  })  : _auth = firebaseAuth,
        _firestoreService = firestoreService,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  final FirebaseAuth _auth;
  final FirestoreService _firestoreService;
  final GoogleSignIn _googleSignIn;

  /// Current user stream.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Current user.
  User? get currentUser => _auth.currentUser;

  /// Whether a user is signed in.
  bool get isSignedIn => currentUser != null;

  /// Signs in with email and password.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Creates a new account with email and password.
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update display name if provided
    if (displayName != null && credential.user != null) {
      await credential.user!.updateDisplayName(displayName);
    }

    // Create user profile in Firestore
    if (credential.user != null) {
      await _createUserProfile(
        user: credential.user!,
        displayName: displayName,
      );
    }

    return credential;
  }

  /// Signs in with Google.
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User cancelled the sign-in
      return null;
    }

    // Obtain the auth details from the request
    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the credential
    final userCredential = await _auth.signInWithCredential(credential);

    // Create user profile if new user
    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      await _createUserProfile(
        user: userCredential.user!,
        displayName: googleUser.displayName,
        photoUrl: googleUser.photoUrl,
      );
    }

    return userCredential;
  }

  /// Signs in with Apple (iOS only).
  Future<UserCredential?> signInWithApple() async {
    if (!Platform.isIOS) {
      throw UnsupportedError('Apple Sign In is only available on iOS');
    }

    // Request credential for the currently signed in Apple account
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // Create an OAuthCredential from the credential returned by Apple
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    // Sign in to Firebase with the credential
    final userCredential = await _auth.signInWithCredential(oauthCredential);

    // Create user profile if new user
    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      // Apple only provides name on first sign-in
      final displayName = appleCredential.givenName != null
          ? '${appleCredential.givenName} ${appleCredential.familyName ?? ''}'
              .trim()
          : null;

      await _createUserProfile(
        user: userCredential.user!,
        displayName: displayName,
      );
    }

    return userCredential;
  }

  /// Sends a password reset email.
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    // Sign out from Google if signed in with Google
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }

    await _auth.signOut();
  }

  /// Deletes the current user's account.
  /// Requires recent authentication.
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('No user signed in');
    }

    // Delete user data from Firestore first
    await _firestoreService.deleteUserData(user.uid);

    // Delete the Firebase Auth account
    await user.delete();
  }

  /// Re-authenticates the user with email and password.
  /// Required before sensitive operations like account deletion.
  Future<void> reauthenticateWithEmail({
    required String email,
    required String password,
  }) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('No user signed in');
    }

    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await user.reauthenticateWithCredential(credential);
  }

  /// Re-authenticates the user with Google.
  Future<void> reauthenticateWithGoogle() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('No user signed in');
    }

    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw StateError('Google sign-in cancelled');
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await user.reauthenticateWithCredential(credential);
  }

  /// Creates a user profile in Firestore.
  Future<void> _createUserProfile({
    required User user,
    String? displayName,
    String? photoUrl,
  }) async {
    final profile = UserProfile(
      uid: user.uid,
      email: user.email ?? '',
      displayName: displayName ?? user.displayName,
      photoUrl: photoUrl ?? user.photoURL,
      createdAt: DateTime.now(),
    );

    await _firestoreService.setUserProfile(profile);
  }
}
