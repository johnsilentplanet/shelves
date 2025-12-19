import 'package:drift/drift.dart';

/// Books table for local SQLite storage.
@DataClassName('BookEntity')
class Books extends Table {
  /// Unique identifier for the book.
  TextColumn get id => text()();

  /// ISBN (ISBN-10 or ISBN-13).
  TextColumn get isbn => text()();

  /// Book title.
  TextColumn get title => text()();

  /// Optional subtitle.
  TextColumn get subtitle => text().nullable()();

  /// List of authors as JSON array.
  TextColumn get authors => text().withDefault(const Constant('[]'))();

  /// Publisher name.
  TextColumn get publisher => text().nullable()();

  /// Publication date as string.
  TextColumn get publishedDate => text().nullable()();

  /// Book description/summary.
  TextColumn get bookDescription => text().nullable()();

  /// Cover image stored as bytes.
  BlobColumn get coverImageData => blob().nullable()();

  /// Cover image URL from API.
  TextColumn get coverImageUrl => text().nullable()();

  /// Number of pages.
  IntColumn get pageCount => integer().nullable()();

  /// Categories/genres as JSON array.
  TextColumn get categories => text().withDefault(const Constant('[]'))();

  /// Language code (e.g., 'en').
  TextColumn get language => text().nullable()();

  /// When the book was added to the library.
  DateTimeColumn get dateAdded => dateTime()();

  /// Dewey Decimal classification number.
  TextColumn get deweyDecimalNumber => text().nullable()();

  /// BISAC category (AI-generated, premium feature).
  TextColumn get bisacCategory => text().nullable()();

  /// BISAC subcategory (AI-generated, premium feature).
  TextColumn get bisacSubcategory => text().nullable()();

  /// ID of the shelf this book belongs to.
  TextColumn get shelfId => text().nullable()();

  /// User's personal notes about the book.
  TextColumn get notes => text().nullable()();

  /// User-defined tags as JSON array.
  TextColumn get tags => text().withDefault(const Constant('[]'))();

  /// IDs of related books as JSON array.
  TextColumn get relatedBookIds => text().withDefault(const Constant('[]'))();

  /// Name of person who borrowed this book.
  TextColumn get loanedTo => text().nullable()();

  /// Date when the book was loaned out.
  DateTimeColumn get loanDate => dateTime().nullable()();

  /// User's rating (1-5 stars).
  IntColumn get userRating => integer().nullable()();

  /// Date when the user finished reading.
  DateTimeColumn get dateRead => dateTime().nullable()();

  /// Current reading status as string.
  TextColumn get readingStatus => text().nullable()();

  /// Last time this book was updated.
  DateTimeColumn get updatedAt => dateTime()();

  /// Whether this book has been synced to the cloud.
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
