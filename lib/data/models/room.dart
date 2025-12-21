import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

/// A room for grouping shelves by physical location.
@freezed
sealed class Room with _$Room {
  const factory Room({
    /// Unique identifier for the room.
    required String id,

    /// Display name of the room (e.g., 'Living Room', 'Office').
    required String name,

    /// When the room was created.
    required DateTime dateCreated,

    /// Last time this room was updated.
    required DateTime updatedAt,

    /// Whether this room has been synced to the cloud.
    @Default(false) bool isSynced,
  }) = _Room;

  const Room._();

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
