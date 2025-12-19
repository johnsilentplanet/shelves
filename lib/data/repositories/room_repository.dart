import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../datasources/local/database.dart';
import '../datasources/local/daos/rooms_dao.dart';
import '../datasources/remote/firestore_service.dart';
import '../models/models.dart';

/// Repository for room operations.
/// Abstracts local database and remote Firestore operations.
class RoomRepository {
  RoomRepository({
    required RoomsDao roomsDao,
    required FirestoreService firestoreService,
  })  : _roomsDao = roomsDao,
        _firestoreService = firestoreService;

  final RoomsDao _roomsDao;
  final FirestoreService _firestoreService;
  static const _uuid = Uuid();

  // ==================== Local Operations ====================

  /// Gets all rooms from local database.
  Future<List<Room>> getAllRooms() async {
    final entities = await _roomsDao.getAllRooms();
    return entities.map(_entityToModel).toList();
  }

  /// Watches all rooms from local database.
  Stream<List<Room>> watchAllRooms() {
    return _roomsDao.watchAllRooms().map(
          (entities) => entities.map(_entityToModel).toList(),
        );
  }

  /// Gets a room by ID.
  Future<Room?> getRoomById(String id) async {
    final entity = await _roomsDao.getRoomById(id);
    return entity != null ? _entityToModel(entity) : null;
  }

  /// Gets room count.
  Future<int> getRoomCount() => _roomsDao.getRoomCount();

  /// Gets unsynced rooms.
  Future<List<Room>> getUnsyncedRooms() async {
    final entities = await _roomsDao.getUnsyncedRooms();
    return entities.map(_entityToModel).toList();
  }

  /// Creates a new room with a generated ID.
  Future<Room> createRoom({required String name}) async {
    final now = DateTime.now();
    final room = Room(
      id: _uuid.v4(),
      name: name,
      dateCreated: now,
      updatedAt: now,
      isSynced: false,
    );

    await _roomsDao.insertRoom(_modelToCompanion(room));
    return room;
  }

  /// Saves a room (insert or update).
  Future<void> saveRoom(Room room) async {
    final updated = room.copyWith(
      updatedAt: DateTime.now(),
      isSynced: false,
    );
    await _roomsDao.upsertRoom(_modelToCompanion(updated));
  }

  /// Deletes a room.
  Future<void> deleteRoom(String id) async {
    await _roomsDao.deleteRoom(id);
  }

  /// Marks a room as synced.
  Future<void> markAsSynced(String id) async {
    await _roomsDao.markAsSynced(id);
  }

  // ==================== Remote Sync Operations ====================

  /// Syncs rooms to Firestore.
  Future<void> syncToRemote(String userId) async {
    final unsyncedRooms = await getUnsyncedRooms();
    if (unsyncedRooms.isEmpty) return;

    for (final room in unsyncedRooms) {
      await _firestoreService.setRoom(userId, room);
      await markAsSynced(room.id);
    }
  }

  /// Fetches rooms from Firestore and merges with local.
  Future<void> syncFromRemote(String userId) async {
    final remoteRooms = await _firestoreService.getAllRooms(userId);

    for (final remoteRoom in remoteRooms) {
      final localRoom = await getRoomById(remoteRoom.id);

      if (localRoom == null) {
        // New room from remote
        await _roomsDao.upsertRoom(_modelToCompanion(
          remoteRoom.copyWith(isSynced: true),
        ));
      } else if (remoteRoom.updatedAt.isAfter(localRoom.updatedAt)) {
        // Remote is newer, update local
        await _roomsDao.upsertRoom(_modelToCompanion(
          remoteRoom.copyWith(isSynced: true),
        ));
      }
    }
  }

  // ==================== Converters ====================

  Room _entityToModel(RoomEntity entity) {
    return Room(
      id: entity.id,
      name: entity.name,
      dateCreated: entity.dateCreated,
      updatedAt: entity.updatedAt,
      isSynced: entity.isSynced,
    );
  }

  RoomsCompanion _modelToCompanion(Room room) {
    return RoomsCompanion(
      id: Value(room.id),
      name: Value(room.name),
      dateCreated: Value(room.dateCreated),
      updatedAt: Value(room.updatedAt),
      isSynced: Value(room.isSynced),
    );
  }
}
