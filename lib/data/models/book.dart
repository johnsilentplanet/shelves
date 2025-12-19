import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'reading_status.dart';

part 'book.freezed.dart';
part 'book.g.dart';

/// A book in the user's library.
@freezed
class Book with _$Book {
  const factory Book({
    /// Unique identifier for the book.
    required String id,

    /// ISBN (ISBN-10 or ISBN-13).
    required String isbn,

    /// Book title.
    required String title,

    /// Optional subtitle.
    String? subtitle,

    /// List of authors.
    @Default([]) List<String> authors,

    /// Publisher name.
    String? publisher,

    /// Publication date as string (may be year only or full date).
    String? publishedDate,

    /// Book description/summary.
    String? description,

    /// Cover image stored as bytes.
    @Uint8ListConverter() Uint8List? coverImageData,

    /// Cover image URL from API (not stored locally).
    String? coverImageUrl,

    /// Number of pages.
    int? pageCount,

    /// Categories/genres from API.
    @Default([]) List<String> categories,

    /// Language code (e.g., 'en').
    String? language,

    /// When the book was added to the library.
    required DateTime dateAdded,

    /// Dewey Decimal classification number.
    String? deweyDecimalNumber,

    /// BISAC category (AI-generated, premium feature).
    String? bisacCategory,

    /// BISAC subcategory (AI-generated, premium feature).
    String? bisacSubcategory,

    /// ID of the shelf this book belongs to.
    String? shelfId,

    /// User's personal notes about the book.
    String? notes,

    /// User-defined tags for organization.
    @Default([]) List<String> tags,

    /// IDs of related books (AI-generated, premium feature).
    @Default([]) List<String> relatedBookIds,

    /// Name of person who borrowed this book.
    String? loanedTo,

    /// Date when the book was loaned out.
    DateTime? loanDate,

    /// User's rating (1-5 stars).
    int? userRating,

    /// Date when the user finished reading.
    DateTime? dateRead,

    /// Current reading status.
    @ReadingStatusConverter() ReadingStatus? readingStatus,

    /// Last time this book was updated.
    required DateTime updatedAt,

    /// Whether this book has been synced to the cloud.
    @Default(false) bool isSynced,
  }) = _Book;

  const Book._();

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  /// Returns the primary author or 'Unknown Author' if no authors.
  String get primaryAuthor =>
      authors.isNotEmpty ? authors.first : 'Unknown Author';

  /// Returns all authors as a comma-separated string.
  String get authorsDisplay => authors.join(', ');

  /// Returns true if the book is currently loaned out.
  bool get isLoaned => loanedTo != null && loanedTo!.isNotEmpty;

  /// Returns the number of days the book has been loaned.
  int? get daysLoaned {
    if (loanDate == null) return null;
    return DateTime.now().difference(loanDate!).inDays;
  }
}

/// Converter for [Uint8List] to/from JSON (base64 encoded).
class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    // ignore: avoid_dynamic_calls
    return Uint8List.fromList(
      (Uri.parse('data:;base64,$json').data?.contentAsBytes()) ?? [],
    );
  }

  @override
  String? toJson(Uint8List? object) {
    if (object == null || object.isEmpty) return null;
    return Uri.dataFromBytes(object).data?.contentAsString();
  }
}

/// Converter for [ReadingStatus] to/from JSON.
class ReadingStatusConverter
    implements JsonConverter<ReadingStatus?, String?> {
  const ReadingStatusConverter();

  @override
  ReadingStatus? fromJson(String? json) => ReadingStatus.fromString(json);

  @override
  String? toJson(ReadingStatus? object) => object?.value;
}
