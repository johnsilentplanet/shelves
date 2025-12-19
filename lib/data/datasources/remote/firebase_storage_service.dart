import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

/// Service for Firebase Storage operations (cover images).
class FirebaseStorageService {
  FirebaseStorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  final FirebaseStorage _storage;

  /// Gets the storage reference for a book cover.
  Reference _coverRef(String userId, String bookId) =>
      _storage.ref().child('users').child(userId).child('covers').child('$bookId.jpg');

  /// Uploads a cover image and returns the download URL.
  Future<String> uploadCoverImage({
    required String userId,
    required String bookId,
    required Uint8List imageData,
  }) async {
    final ref = _coverRef(userId, bookId);
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {
        'uploadedAt': DateTime.now().toIso8601String(),
      },
    );

    await ref.putData(imageData, metadata);
    return ref.getDownloadURL();
  }

  /// Downloads a cover image.
  Future<Uint8List?> downloadCoverImage({
    required String userId,
    required String bookId,
  }) async {
    try {
      final ref = _coverRef(userId, bookId);
      // Max 5MB for cover images
      return await ref.getData(5 * 1024 * 1024);
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return null;
      }
      rethrow;
    }
  }

  /// Checks if a cover image exists.
  Future<bool> coverExists({
    required String userId,
    required String bookId,
  }) async {
    try {
      final ref = _coverRef(userId, bookId);
      await ref.getMetadata();
      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return false;
      }
      rethrow;
    }
  }

  /// Gets the download URL for a cover image.
  Future<String?> getCoverUrl({
    required String userId,
    required String bookId,
  }) async {
    try {
      final ref = _coverRef(userId, bookId);
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return null;
      }
      rethrow;
    }
  }

  /// Deletes a cover image.
  Future<void> deleteCoverImage({
    required String userId,
    required String bookId,
  }) async {
    try {
      final ref = _coverRef(userId, bookId);
      await ref.delete();
    } on FirebaseException catch (e) {
      // Ignore if not found
      if (e.code != 'object-not-found') {
        rethrow;
      }
    }
  }

  /// Deletes all cover images for a user.
  Future<void> deleteAllCovers(String userId) async {
    try {
      final ref = _storage.ref().child('users').child(userId).child('covers');
      final listResult = await ref.listAll();
      for (final item in listResult.items) {
        await item.delete();
      }
    } on FirebaseException catch (e) {
      // Ignore if folder doesn't exist
      if (e.code != 'object-not-found') {
        rethrow;
      }
    }
  }
}
