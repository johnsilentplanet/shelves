import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../data/models/shelf.dart';
import '../../auth/providers/auth_provider.dart';
import '../../library/providers/books_provider.dart';

part 'shelves_provider.freezed.dart';
part 'shelves_provider.g.dart';

/// Stream of all shelves from the local database.
@riverpod
Stream<List<Shelf>> allShelves(Ref ref) =>
    ref.watch(shelfRepositoryProvider).watchAllShelves();

/// A single shelf by ID.
@riverpod
Future<Shelf?> shelfById(Ref ref, String id) =>
    ref.watch(shelfRepositoryProvider).getShelfById(id);

/// Shelves filtered by room ID.
@riverpod
Stream<List<Shelf>> shelvesByRoom(Ref ref, String roomId) =>
    ref.watch(shelfRepositoryProvider).watchShelvesByRoomId(roomId);

/// A shelf with its book count.
@freezed
sealed class ShelfWithBookCount with _$ShelfWithBookCount {
  const factory ShelfWithBookCount({
    required Shelf shelf,
    required int bookCount,
  }) = _ShelfWithBookCount;
}

/// All shelves with their book counts.
@riverpod
List<ShelfWithBookCount> shelvesWithBookCount(Ref ref) {
  final shelvesAsync = ref.watch(allShelvesProvider);
  final booksAsync = ref.watch(allBooksProvider);

  // Return empty list while loading or on error
  final shelves = shelvesAsync.value ?? [];
  final books = booksAsync.value ?? [];

  return shelves.map((shelf) {
    final count = books.where((book) => book.shelfId == shelf.id).length;
    return ShelfWithBookCount(shelf: shelf, bookCount: count);
  }).toList();
}

/// Notifier for shelf CRUD operations.
@riverpod
class ShelvesNotifier extends _$ShelvesNotifier {
  @override
  void build() {}

  /// Creates a new shelf.
  Future<Shelf> createShelf({
    required String name,
    String? roomId,
  }) async {
    final repository = ref.read(shelfRepositoryProvider);
    return repository.createShelf(name: name, roomId: roomId);
  }

  /// Updates an existing shelf.
  Future<void> updateShelf(Shelf shelf) async {
    final repository = ref.read(shelfRepositoryProvider);
    await repository.saveShelf(shelf);
  }

  /// Deletes a shelf by ID.
  Future<void> deleteShelf(String id) async {
    final repository = ref.read(shelfRepositoryProvider);
    await repository.deleteShelf(id);
  }

  /// Renames a shelf.
  Future<void> renameShelf(String id, String newName) async {
    final repository = ref.read(shelfRepositoryProvider);
    final shelf = await repository.getShelfById(id);
    if (shelf != null) {
      await repository.saveShelf(shelf.copyWith(name: newName));
    }
  }

  /// Moves a shelf to a different room.
  Future<void> moveShelfToRoom(String shelfId, String? roomId) async {
    final repository = ref.read(shelfRepositoryProvider);
    final shelf = await repository.getShelfById(shelfId);
    if (shelf != null) {
      await repository.saveShelf(shelf.copyWith(roomId: roomId));
    }
  }

  /// Syncs shelves to the remote server.
  Future<void> syncToRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(shelfRepositoryProvider);
    await repository.syncToRemote(userId);
  }

  /// Syncs shelves from the remote server.
  Future<void> syncFromRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(shelfRepositoryProvider);
    await repository.syncFromRemote(userId);
  }
}
