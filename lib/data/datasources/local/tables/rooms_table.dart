import 'package:drift/drift.dart';

/// Rooms table for local SQLite storage.
@DataClassName('RoomEntity')
class Rooms extends Table {
  /// Unique identifier for the room.
  TextColumn get id => text()();

  /// Display name of the room.
  TextColumn get name => text()();

  /// When the room was created.
  DateTimeColumn get dateCreated => dateTime()();

  /// Last time this room was updated.
  DateTimeColumn get updatedAt => dateTime()();

  /// Whether this room has been synced to the cloud.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
