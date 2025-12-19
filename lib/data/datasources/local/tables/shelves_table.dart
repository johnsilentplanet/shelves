import 'package:drift/drift.dart';

/// Shelves table for local SQLite storage.
@DataClassName('ShelfEntity')
class Shelves extends Table {
  /// Unique identifier for the shelf.
  TextColumn get id => text()();

  /// Display name of the shelf.
  TextColumn get name => text()();

  /// Optional room ID this shelf belongs to.
  TextColumn get roomId => text().nullable()();

  /// When the shelf was created.
  DateTimeColumn get dateCreated => dateTime()();

  /// Last time this shelf was updated.
  DateTimeColumn get updatedAt => dateTime()();

  /// Whether this shelf has been synced to the cloud.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
