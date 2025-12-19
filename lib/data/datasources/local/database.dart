import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'daos/books_dao.dart';
import 'daos/rooms_dao.dart';
import 'daos/shelves_dao.dart';
import 'tables/books_table.dart';
import 'tables/rooms_table.dart';
import 'tables/shelves_table.dart';

part 'database.g.dart';

/// The main database for the Shelves app.
@DriftDatabase(
  tables: [Books, Shelves, Rooms],
  daos: [BooksDao, ShelvesDao, RoomsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Constructor for testing with a custom query executor.
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
      },
      beforeOpen: (details) async {
        // Enable foreign keys
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  /// Clears all data from the database.
  Future<void> clearAllData() async {
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

/// Opens a connection to the database.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'shelves.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
