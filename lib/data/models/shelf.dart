import 'package:freezed_annotation/freezed_annotation.dart';

part 'shelf.freezed.dart';
part 'shelf.g.dart';

/// A shelf for organizing books.
@freezed
sealed class Shelf with _$Shelf {
  const factory Shelf({
    /// Unique identifier for the shelf.
    required String id,

    /// Display name of the shelf.
    required String name,

    /// Optional room ID this shelf belongs to.
    String? roomId,

    /// When the shelf was created.
    required DateTime dateCreated,

    /// Last time this shelf was updated.
    required DateTime updatedAt,

    /// Whether this shelf has been synced to the cloud.
    @Default(false) bool isSynced,
  }) = _Shelf;

  const Shelf._();

  factory Shelf.fromJson(Map<String, dynamic> json) => _$ShelfFromJson(json);
}
