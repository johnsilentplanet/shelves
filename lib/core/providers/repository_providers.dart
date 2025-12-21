import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/book_repository.dart';
import '../../data/repositories/metadata_repository.dart';
import '../../data/repositories/room_repository.dart';
import '../../data/repositories/shelf_repository.dart';
import 'dao_providers.dart';
import 'remote_service_providers.dart';

part 'repository_providers.g.dart';

/// Provides the BookRepository instance.
@Riverpod(keepAlive: true)
BookRepository bookRepository(Ref ref) => BookRepository(
      booksDao: ref.watch(booksDaoProvider),
      firestoreService: ref.watch(firestoreServiceProvider),
    );

/// Provides the ShelfRepository instance.
@Riverpod(keepAlive: true)
ShelfRepository shelfRepository(Ref ref) => ShelfRepository(
      shelvesDao: ref.watch(shelvesDaoProvider),
      firestoreService: ref.watch(firestoreServiceProvider),
    );

/// Provides the RoomRepository instance.
@Riverpod(keepAlive: true)
RoomRepository roomRepository(Ref ref) => RoomRepository(
      roomsDao: ref.watch(roomsDaoProvider),
      firestoreService: ref.watch(firestoreServiceProvider),
    );

/// Provides the MetadataRepository instance.
@Riverpod(keepAlive: true)
MetadataRepository metadataRepository(Ref ref) => MetadataRepository(
      googleBooksApi: ref.watch(googleBooksApiProvider),
      openLibraryApi: ref.watch(openLibraryApiProvider),
    );
