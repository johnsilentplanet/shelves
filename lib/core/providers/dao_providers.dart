import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/local/daos/books_dao.dart';
import '../../data/datasources/local/daos/rooms_dao.dart';
import '../../data/datasources/local/daos/shelves_dao.dart';
import 'database_provider.dart';

part 'dao_providers.g.dart';

/// Provides the BooksDao instance.
@Riverpod(keepAlive: true)
BooksDao booksDao(Ref ref) => ref.watch(appDatabaseProvider).booksDao;

/// Provides the ShelvesDao instance.
@Riverpod(keepAlive: true)
ShelvesDao shelvesDao(Ref ref) => ref.watch(appDatabaseProvider).shelvesDao;

/// Provides the RoomsDao instance.
@Riverpod(keepAlive: true)
RoomsDao roomsDao(Ref ref) => ref.watch(appDatabaseProvider).roomsDao;
