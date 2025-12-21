import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/providers/firebase_providers.dart';
import '../../../core/providers/remote_service_providers.dart';
import '../../../data/models/user_profile.dart';

part 'auth_provider.freezed.dart';
part 'auth_provider.g.dart';

/// Stream of authentication state changes.
@riverpod
Stream<User?> authState(Ref ref) =>
    ref.watch(firebaseAuthProvider).authStateChanges();

/// The currently authenticated user, or null if not authenticated.
@riverpod
User? currentUser(Ref ref) {
  final authState = ref.watch(authStateProvider);
  return authState.value;
}

/// Whether a user is currently authenticated.
@riverpod
bool isAuthenticated(Ref ref) => ref.watch(currentUserProvider) != null;

/// The current user's ID, or null if not authenticated.
@riverpod
String? currentUserId(Ref ref) => ref.watch(currentUserProvider)?.uid;

/// The current user's profile from Firestore.
@riverpod
Future<UserProfile?> userProfile(Ref ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return null;

  final firestoreService = ref.watch(firestoreServiceProvider);
  return firestoreService.getUserProfile(userId);
}

/// State for authentication operations.
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    String? error,
  }) = _AuthState;
}

/// Notifier for authentication operations.
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState();

  FirebaseAuth get _auth => ref.read(firebaseAuthProvider);

  /// Signs in with email and password.
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AuthState(isLoading: true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    }
  }

  /// Creates a new account with email and password.
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = const AuthState(isLoading: true);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (displayName != null) {
        await credential.user?.updateDisplayName(displayName);
      }

      // Create user profile in Firestore (non-blocking)
      final userId = credential.user?.uid;
      if (userId != null) {
        try {
          final firestoreService = ref.read(firestoreServiceProvider);
          await firestoreService.setUserProfile(
            UserProfile(
              uid: userId,
              email: email,
              displayName: displayName,
              createdAt: DateTime.now(),
            ),
          );
        } catch (e) {
          // Profile creation failed, but sign-up succeeded - continue
        }
      }

      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    }
  }

  /// Sends a password reset email.
  Future<bool> sendPasswordResetEmail(String email) async {
    state = const AuthState(isLoading: true);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    state = const AuthState(isLoading: true);
    try {
      await _auth.signOut();
      state = const AuthState();
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
    }
  }

  /// Deletes the current user's account.
  /// Requires recent authentication.
  Future<bool> deleteAccount() async {
    state = const AuthState(isLoading: true);
    try {
      final user = _auth.currentUser;
      if (user == null) {
        state = const AuthState(error: 'No user signed in');
        return false;
      }

      // Delete user data from Firestore first
      final firestoreService = ref.read(firestoreServiceProvider);
      await firestoreService.deleteUserData(user.uid);

      // Delete the Firebase Auth account
      await user.delete();

      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    }
  }

  /// Re-authenticates the user with email and password.
  /// Required before sensitive operations like account deletion.
  Future<bool> reauthenticateWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AuthState(isLoading: true);
    try {
      final user = _auth.currentUser;
      if (user == null) {
        state = const AuthState(error: 'No user signed in');
        return false;
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    }
  }

  /// Signs in with Google.
  Future<bool> signInWithGoogle() async {
    state = const AuthState(isLoading: true);
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled
        state = const AuthState();
        return false;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      // Create user profile if new user (non-blocking)
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        try {
          final firestoreService = ref.read(firestoreServiceProvider);
          await firestoreService.setUserProfile(
            UserProfile(
              uid: userCredential.user!.uid,
              email: userCredential.user!.email ?? '',
              displayName: googleUser.displayName,
              photoUrl: googleUser.photoUrl,
              createdAt: DateTime.now(),
            ),
          );
        } catch (e) {
          // Profile creation failed, but sign-in succeeded - continue
        }
      }

      state = const AuthState();
      return true;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    } catch (e) {
      state = AuthState(error: 'Google sign-in error: $e');
      return false;
    }
  }

  /// Signs in with Apple (iOS only).
  Future<bool> signInWithApple() async {
    if (!Platform.isIOS) {
      state = const AuthState(error: 'Apple Sign In is only available on iOS');
      return false;
    }

    state = const AuthState(isLoading: true);
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Verify we got a valid identity token
      final identityToken = appleCredential.identityToken;
      if (identityToken == null) {
        state = const AuthState(error: 'Apple sign-in failed. No identity token received.');
        return false;
      }

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final userCredential = await _auth.signInWithCredential(oauthCredential);

      // Create user profile if new user (non-blocking)
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        try {
          final displayName = appleCredential.givenName != null
              ? '${appleCredential.givenName} ${appleCredential.familyName ?? ''}'
                  .trim()
              : null;

          final firestoreService = ref.read(firestoreServiceProvider);
          await firestoreService.setUserProfile(
            UserProfile(
              uid: userCredential.user!.uid,
              email: userCredential.user!.email ?? appleCredential.email ?? '',
              displayName: displayName,
              createdAt: DateTime.now(),
            ),
          );
        } catch (e) {
          // Profile creation failed, but sign-in succeeded - continue
        }
      }

      state = const AuthState();
      return true;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        state = const AuthState();
        return false;
      }
      state = AuthState(error: 'Apple authorization failed: ${e.message}');
      return false;
    } on FirebaseAuthException catch (e) {
      state = AuthState(error: _mapAuthError(e.code));
      return false;
    } catch (e) {
      // Log the actual error for debugging
      state = AuthState(error: 'Apple sign-in error: $e');
      return false;
    }
  }

  /// Clears any error state.
  void clearError() {
    state = state.copyWith(error: null);
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'requires-recent-login':
        return 'Please sign in again to perform this action';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      default:
        return 'An error occurred. Please try again';
    }
  }
}
