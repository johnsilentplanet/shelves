import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/repository_providers.dart';
import '../../../data/models/room.dart';
import '../../auth/providers/auth_provider.dart';
import 'shelves_provider.dart';

part 'rooms_provider.freezed.dart';
part 'rooms_provider.g.dart';

/// Stream of all rooms from the local database.
@riverpod
Stream<List<Room>> allRooms(Ref ref) =>
    ref.watch(roomRepositoryProvider).watchAllRooms();

/// A single room by ID.
@riverpod
Future<Room?> roomById(Ref ref, String id) =>
    ref.watch(roomRepositoryProvider).getRoomById(id);

/// A room with its shelf count.
@freezed
sealed class RoomWithShelfCount with _$RoomWithShelfCount {
  const factory RoomWithShelfCount({
    required Room room,
    required int shelfCount,
  }) = _RoomWithShelfCount;
}

/// All rooms with their shelf counts.
@riverpod
List<RoomWithShelfCount> roomsWithShelfCount(Ref ref) {
  final roomsAsync = ref.watch(allRoomsProvider);
  final shelvesAsync = ref.watch(allShelvesProvider);

  // Return empty list while loading or on error
  final rooms = roomsAsync.value ?? [];
  final shelves = shelvesAsync.value ?? [];

  return rooms.map((room) {
    final count = shelves.where((shelf) => shelf.roomId == room.id).length;
    return RoomWithShelfCount(room: room, shelfCount: count);
  }).toList();
}

/// Notifier for room CRUD operations.
@riverpod
class RoomsNotifier extends _$RoomsNotifier {
  @override
  void build() {}

  /// Creates a new room.
  Future<Room> createRoom({required String name}) async {
    final repository = ref.read(roomRepositoryProvider);
    return repository.createRoom(name: name);
  }

  /// Updates an existing room.
  Future<void> updateRoom(Room room) async {
    final repository = ref.read(roomRepositoryProvider);
    await repository.saveRoom(room);
  }

  /// Deletes a room by ID.
  /// Note: This does not delete shelves in the room, just unassigns them.
  Future<void> deleteRoom(String id) async {
    // First, unassign all shelves from this room
    final shelfRepository = ref.read(shelfRepositoryProvider);
    final shelves = await shelfRepository.getShelvesByRoomId(id);
    for (final shelf in shelves) {
      await shelfRepository.saveShelf(shelf.copyWith(roomId: null));
    }

    // Then delete the room
    final repository = ref.read(roomRepositoryProvider);
    await repository.deleteRoom(id);
  }

  /// Renames a room.
  Future<void> renameRoom(String id, String newName) async {
    final repository = ref.read(roomRepositoryProvider);
    final room = await repository.getRoomById(id);
    if (room != null) {
      await repository.saveRoom(room.copyWith(name: newName));
    }
  }

  /// Syncs rooms to the remote server.
  Future<void> syncToRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(roomRepositoryProvider);
    await repository.syncToRemote(userId);
  }

  /// Syncs rooms from the remote server.
  Future<void> syncFromRemote() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final repository = ref.read(roomRepositoryProvider);
    await repository.syncFromRemote(userId);
  }
}
