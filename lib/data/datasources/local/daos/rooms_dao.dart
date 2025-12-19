import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/rooms_table.dart';

part 'rooms_dao.g.dart';

/// Data Access Object for rooms.
@DriftAccessor(tables: [Rooms])
class RoomsDao extends DatabaseAccessor<AppDatabase> with _$RoomsDaoMixin {
  RoomsDao(super.db);

  /// Get all rooms ordered by name.
  Future<List<RoomEntity>> getAllRooms() =>
      (select(rooms)..orderBy([(t) => OrderingTerm.asc(t.name)])).get();

  /// Watch all rooms ordered by name.
  Stream<List<RoomEntity>> watchAllRooms() =>
      (select(rooms)..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();

  /// Get a room by ID.
  Future<RoomEntity?> getRoomById(String id) =>
      (select(rooms)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Get unsynced rooms.
  Future<List<RoomEntity>> getUnsyncedRooms() =>
      (select(rooms)..where((t) => t.isSynced.equals(false))).get();

  /// Get room count.
  Future<int> getRoomCount() async {
    final count = countAll();
    final query = selectOnly(rooms)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// Insert a room.
  Future<int> insertRoom(RoomsCompanion room) => into(rooms).insert(room);

  /// Insert or update a room.
  Future<int> upsertRoom(RoomsCompanion room) =>
      into(rooms).insertOnConflictUpdate(room);

  /// Update a room.
  Future<bool> updateRoom(RoomEntity room) => update(rooms).replace(room);

  /// Delete a room by ID.
  Future<int> deleteRoom(String id) =>
      (delete(rooms)..where((t) => t.id.equals(id))).go();

  /// Delete all rooms.
  Future<int> deleteAllRooms() => delete(rooms).go();

  /// Mark a room as synced.
  Future<int> markAsSynced(String id) => (update(rooms)
        ..where((t) => t.id.equals(id)))
      .write(const RoomsCompanion(isSynced: Value(true)));
}
