import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/shelves_table.dart';

part 'shelves_dao.g.dart';

/// Data Access Object for shelves.
@DriftAccessor(tables: [Shelves])
class ShelvesDao extends DatabaseAccessor<AppDatabase> with _$ShelvesDaoMixin {
  ShelvesDao(super.db);

  /// Get all shelves ordered by name.
  Future<List<ShelfEntity>> getAllShelves() =>
      (select(shelves)..orderBy([(t) => OrderingTerm.asc(t.name)])).get();

  /// Watch all shelves ordered by name.
  Stream<List<ShelfEntity>> watchAllShelves() =>
      (select(shelves)..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();

  /// Get a shelf by ID.
  Future<ShelfEntity?> getShelfById(String id) =>
      (select(shelves)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Get shelves by room ID.
  Future<List<ShelfEntity>> getShelvesByRoomId(String roomId) =>
      (select(shelves)..where((t) => t.roomId.equals(roomId))).get();

  /// Watch shelves by room ID.
  Stream<List<ShelfEntity>> watchShelvesByRoomId(String roomId) =>
      (select(shelves)..where((t) => t.roomId.equals(roomId))).watch();

  /// Get shelves without a room.
  Future<List<ShelfEntity>> getShelvesWithoutRoom() =>
      (select(shelves)..where((t) => t.roomId.isNull())).get();

  /// Get unsynced shelves.
  Future<List<ShelfEntity>> getUnsyncedShelves() =>
      (select(shelves)..where((t) => t.isSynced.equals(false))).get();

  /// Get shelf count.
  Future<int> getShelfCount() async {
    final count = countAll();
    final query = selectOnly(shelves)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// Insert a shelf.
  Future<int> insertShelf(ShelvesCompanion shelf) =>
      into(shelves).insert(shelf);

  /// Insert or update a shelf.
  Future<int> upsertShelf(ShelvesCompanion shelf) =>
      into(shelves).insertOnConflictUpdate(shelf);

  /// Update a shelf.
  Future<bool> updateShelf(ShelfEntity shelf) =>
      update(shelves).replace(shelf);

  /// Delete a shelf by ID.
  Future<int> deleteShelf(String id) =>
      (delete(shelves)..where((t) => t.id.equals(id))).go();

  /// Delete all shelves.
  Future<int> deleteAllShelves() => delete(shelves).go();

  /// Mark a shelf as synced.
  Future<int> markAsSynced(String id) => (update(shelves)
        ..where((t) => t.id.equals(id)))
      .write(const ShelvesCompanion(isSynced: Value(true)));
}
