import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

/// Service for Firestore operations.
class FirestoreService {
  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  // Collection paths
  static const String _usersCollection = 'users';
  static const String _booksCollection = 'books';
  static const String _shelvesCollection = 'shelves';
  static const String _roomsCollection = 'rooms';
  static const String _profileCollection = 'profile';
  static const String _infoDocument = 'info';

  /// Gets the books collection for a user.
  CollectionReference<Map<String, dynamic>> _booksRef(String userId) =>
      _firestore
          .collection(_usersCollection)
          .doc(userId)
          .collection(_booksCollection);

  /// Gets the shelves collection for a user.
  CollectionReference<Map<String, dynamic>> _shelvesRef(String userId) =>
      _firestore
          .collection(_usersCollection)
          .doc(userId)
          .collection(_shelvesCollection);

  /// Gets the rooms collection for a user.
  CollectionReference<Map<String, dynamic>> _roomsRef(String userId) =>
      _firestore
          .collection(_usersCollection)
          .doc(userId)
          .collection(_roomsCollection);

  /// Gets the user profile document reference.
  DocumentReference<Map<String, dynamic>> _profileRef(String userId) =>
      _firestore
          .collection(_usersCollection)
          .doc(userId)
          .collection(_profileCollection)
          .doc(_infoDocument);

  // ==================== User Profile ====================

  /// Creates or updates a user profile.
  Future<void> setUserProfile(UserProfile profile) async {
    await _profileRef(profile.uid).set(profile.toJson(), SetOptions(merge: true));
  }

  /// Gets a user profile.
  Future<UserProfile?> getUserProfile(String userId) async {
    final doc = await _profileRef(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return UserProfile.fromJson(doc.data()!);
  }

  /// Streams a user profile.
  Stream<UserProfile?> watchUserProfile(String userId) {
    return _profileRef(userId).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return UserProfile.fromJson(doc.data()!);
    });
  }

  /// Deletes a user profile and all their data.
  Future<void> deleteUserData(String userId) async {
    // Delete books
    final booksSnapshot = await _booksRef(userId).get();
    for (final doc in booksSnapshot.docs) {
      await doc.reference.delete();
    }

    // Delete shelves
    final shelvesSnapshot = await _shelvesRef(userId).get();
    for (final doc in shelvesSnapshot.docs) {
      await doc.reference.delete();
    }

    // Delete rooms
    final roomsSnapshot = await _roomsRef(userId).get();
    for (final doc in roomsSnapshot.docs) {
      await doc.reference.delete();
    }

    // Delete profile
    await _profileRef(userId).delete();
  }

  // ==================== Books ====================

  /// Gets all books for a user.
  Future<List<Book>> getAllBooks(String userId) async {
    final snapshot = await _booksRef(userId).get();
    return snapshot.docs
        .map((doc) => Book.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Streams all books for a user.
  Stream<List<Book>> watchAllBooks(String userId) {
    return _booksRef(userId).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Book.fromJson({...doc.data(), 'id': doc.id}))
        .toList());
  }

  /// Gets books modified after a certain time.
  Future<List<Book>> getBooksModifiedAfter(
    String userId,
    DateTime after,
  ) async {
    final snapshot = await _booksRef(userId)
        .where('updatedAt', isGreaterThan: Timestamp.fromDate(after))
        .get();
    return snapshot.docs
        .map((doc) => Book.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Creates or updates a book.
  Future<void> setBook(String userId, Book book) async {
    final json = book.toJson();
    // Convert DateTime fields to Timestamp for Firestore
    if (json['dateAdded'] != null) {
      json['dateAdded'] = Timestamp.fromDate(book.dateAdded);
    }
    if (json['updatedAt'] != null) {
      json['updatedAt'] = Timestamp.fromDate(book.updatedAt);
    }
    if (json['loanDate'] != null && book.loanDate != null) {
      json['loanDate'] = Timestamp.fromDate(book.loanDate!);
    }
    if (json['dateRead'] != null && book.dateRead != null) {
      json['dateRead'] = Timestamp.fromDate(book.dateRead!);
    }
    // Remove cover image data from Firestore (stored in Firebase Storage)
    json.remove('coverImageData');

    await _booksRef(userId).doc(book.id).set(json, SetOptions(merge: true));
  }

  /// Batch upsert books.
  Future<void> batchSetBooks(String userId, List<Book> books) async {
    final batch = _firestore.batch();
    for (final book in books) {
      final json = book.toJson();
      if (json['dateAdded'] != null) {
        json['dateAdded'] = Timestamp.fromDate(book.dateAdded);
      }
      if (json['updatedAt'] != null) {
        json['updatedAt'] = Timestamp.fromDate(book.updatedAt);
      }
      if (json['loanDate'] != null && book.loanDate != null) {
        json['loanDate'] = Timestamp.fromDate(book.loanDate!);
      }
      if (json['dateRead'] != null && book.dateRead != null) {
        json['dateRead'] = Timestamp.fromDate(book.dateRead!);
      }
      json.remove('coverImageData');

      batch.set(_booksRef(userId).doc(book.id), json, SetOptions(merge: true));
    }
    await batch.commit();
  }

  /// Deletes a book.
  Future<void> deleteBook(String userId, String bookId) async {
    await _booksRef(userId).doc(bookId).delete();
  }

  // ==================== Shelves ====================

  /// Gets all shelves for a user.
  Future<List<Shelf>> getAllShelves(String userId) async {
    final snapshot = await _shelvesRef(userId).get();
    return snapshot.docs
        .map((doc) => Shelf.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Streams all shelves for a user.
  Stream<List<Shelf>> watchAllShelves(String userId) {
    return _shelvesRef(userId).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Shelf.fromJson({...doc.data(), 'id': doc.id}))
        .toList());
  }

  /// Creates or updates a shelf.
  Future<void> setShelf(String userId, Shelf shelf) async {
    final json = shelf.toJson();
    if (json['dateCreated'] != null) {
      json['dateCreated'] = Timestamp.fromDate(shelf.dateCreated);
    }
    if (json['updatedAt'] != null) {
      json['updatedAt'] = Timestamp.fromDate(shelf.updatedAt);
    }
    await _shelvesRef(userId).doc(shelf.id).set(json, SetOptions(merge: true));
  }

  /// Batch upsert shelves.
  Future<void> batchSetShelves(String userId, List<Shelf> shelves) async {
    final batch = _firestore.batch();
    for (final shelf in shelves) {
      final json = shelf.toJson();
      if (json['dateCreated'] != null) {
        json['dateCreated'] = Timestamp.fromDate(shelf.dateCreated);
      }
      if (json['updatedAt'] != null) {
        json['updatedAt'] = Timestamp.fromDate(shelf.updatedAt);
      }
      batch.set(
          _shelvesRef(userId).doc(shelf.id), json, SetOptions(merge: true));
    }
    await batch.commit();
  }

  /// Deletes a shelf.
  Future<void> deleteShelf(String userId, String shelfId) async {
    await _shelvesRef(userId).doc(shelfId).delete();
  }

  // ==================== Rooms ====================

  /// Gets all rooms for a user.
  Future<List<Room>> getAllRooms(String userId) async {
    final snapshot = await _roomsRef(userId).get();
    return snapshot.docs
        .map((doc) => Room.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  /// Streams all rooms for a user.
  Stream<List<Room>> watchAllRooms(String userId) {
    return _roomsRef(userId).snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Room.fromJson({...doc.data(), 'id': doc.id}))
        .toList());
  }

  /// Creates or updates a room.
  Future<void> setRoom(String userId, Room room) async {
    final json = room.toJson();
    if (json['dateCreated'] != null) {
      json['dateCreated'] = Timestamp.fromDate(room.dateCreated);
    }
    if (json['updatedAt'] != null) {
      json['updatedAt'] = Timestamp.fromDate(room.updatedAt);
    }
    await _roomsRef(userId).doc(room.id).set(json, SetOptions(merge: true));
  }

  /// Deletes a room.
  Future<void> deleteRoom(String userId, String roomId) async {
    await _roomsRef(userId).doc(roomId).delete();
  }
}
