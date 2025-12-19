import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../datasources/local/database.dart';
import '../datasources/local/daos/shelves_dao.dart';
import '../datasources/remote/firestore_service.dart';
import '../models/models.dart';

/// Repository for shelf operations.
/// Abstracts local database and remote Firestore operations.
class ShelfRepository {
  ShelfRepository({
    required ShelvesDao shelvesDao,
    required FirestoreService firestoreService,
  })  : _shelvesDao = shelvesDao,
        _firestoreService = firestoreService;

  final ShelvesDao _shelvesDao;
  final FirestoreService _firestoreService;
  static const _uuid = Uuid();

  // ==================== Local Operations ====================

  /// Gets all shelves from local database.
  Future<List<Shelf>> getAllShelves() async {
    final entities = await _shelvesDao.getAllShelves();
    return entities.map(_entityToModel).toList();
  }

  /// Watches all shelves from local database.
  Stream<List<Shelf>> watchAllShelves() {
    return _shelvesDao.watchAllShelves().map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets a shelf by ID.
  Future<Shelf?> getShelfById(String id) async {
    final entity = await _shelvesDao.getShelfById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  /// Gets shelves by room ID.
  Future<List<Shelf>> getShelvesByRoomId(String roomId) async {
    final entities = await _shelvesDao.getShelvesByRoomId(roomId);
    return entities.map(_entityToModel).toList();
  }

  /// Watches shelves by room ID.
  Stream<List<Shelf>> watchShelvesByRoomId(String roomId) {
    return _shelvesDao.watchShelvesByRoomId(roomId).map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets shelves without a room.
  Future<List<Shelf>> getShelvesWithoutRoom() async {
    final entities = await _shelvesDao.getShelvesWithoutRoom();
    return entities.map(_entityToModel).toList();
  }

  /// Gets shelf count.
  Future<int> getShelfCount() => _shelvesDao.getShelfCount();

  /// Gets unsynced shelves.
  Future<List<Shelf>> getUnsyncedShelves() async {
    final entities = await _shelvesDao.getUnsyncedShelves();
    return entities.map(_entityToModel).toList();
  }

  /// Creates a new shelf with a generated ID.
  Future<Shelf> createShelf({
    required String name,
    String? roomId,
  }) async {
    final now = DateTime.now();
    final shelf = Shelf(
      id: _uuid.v4(),
      name: name,
      roomId: roomId,
      dateCreated: now,
      updatedAt: now,
      isSynced: false,
    );

    await _shelvesDao.insertShelf(_modelToCompanion(shelf));
    return shelf;
  }

  /// Saves a shelf (insert or update).
  Future<void> saveShelf(Shelf shelf) async {
    final updated = shelf.copyWith(
      updatedAt: DateTime.now(),
      isSynced: false,
    );
    await _shelvesDao.upsertShelf(_modelToCompanion(updated));
  }

  /// Deletes a shelf.
  Future<void> deleteShelf(String id) async {
    await _shelvesDao.deleteShelf(id);
  }

  /// Marks a shelf as synced.
  Future<void> markAsSynced(String id) async {
    await _shelvesDao.markAsSynced(id);
  }

  // ==================== Remote Sync Operations ====================

  /// Syncs shelves to Firestore.
  Future<void> syncToRemote(String userId) async {
    final unsyncedShelves = await getUnsyncedShelves();
    if (unsyncedShelves.isEmpty) return;

    await _firestoreService.batchSetShelves(userId, unsyncedShelves);

    for (final shelf in unsyncedShelves) {
      await markAsSynced(shelf.id);
    }
  }

  /// Fetches shelves from Firestore and merges with local.
  Future<void> syncFromRemote(String userId) async {
    final remoteShelves = await _firestoreService.getAllShelves(userId);

    for (final remoteShelf in remoteShelves) {
      final localShelf = await getShelfById(remoteShelf.id);

      if (localShelf == null) {
        // New shelf from remote
        await _shelvesDao.upsertShelf(_modelToCompanion(
          remoteShelf.copyWith(isSynced: true),
        ));
      } else if (remoteShelf.updatedAt.isAfter(localShelf.updatedAt)) {
        // Remote is newer, update local
        await _shelvesDao.upsertShelf(_modelToCompanion(
          remoteShelf.copyWith(isSynced: true),
        ));
      }
    }
  }

  // ==================== Converters ====================

  Shelf _entityToModel(ShelfEntity entity) {
    return Shelf(
      id: entity.id,
      name: entity.name,
      roomId: entity.roomId,
      dateCreated: entity.dateCreated,
      updatedAt: entity.updatedAt,
      isSynced: entity.isSynced,
    );
  }

  ShelvesCompanion _modelToCompanion(Shelf shelf) {
    return ShelvesCompanion(
      id: Value(shelf.id),
      name: Value(shelf.name),
      roomId: Value(shelf.roomId),
      dateCreated: Value(shelf.dateCreated),
      updatedAt: Value(shelf.updatedAt),
      isSynced: Value(shelf.isSynced),
    );
  }
}
