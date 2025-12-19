// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BooksTable extends Books with TableInfo<$BooksTable, BookEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isbnMeta = const VerificationMeta('isbn');
  @override
  late final GeneratedColumn<String> isbn = GeneratedColumn<String>(
    'isbn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorsMeta = const VerificationMeta(
    'authors',
  );
  @override
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
    'authors',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _publisherMeta = const VerificationMeta(
    'publisher',
  );
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedDateMeta = const VerificationMeta(
    'publishedDate',
  );
  @override
  late final GeneratedColumn<String> publishedDate = GeneratedColumn<String>(
    'published_date',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookDescriptionMeta = const VerificationMeta(
    'bookDescription',
  );
  @override
  late final GeneratedColumn<String> bookDescription = GeneratedColumn<String>(
    'book_description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverImageDataMeta = const VerificationMeta(
    'coverImageData',
  );
  @override
  late final GeneratedColumn<Uint8List> coverImageData =
      GeneratedColumn<Uint8List>(
        'cover_image_data',
        aliasedName,
        true,
        type: DriftSqlType.blob,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _coverImageUrlMeta = const VerificationMeta(
    'coverImageUrl',
  );
  @override
  late final GeneratedColumn<String> coverImageUrl = GeneratedColumn<String>(
    'cover_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoriesMeta = const VerificationMeta(
    'categories',
  );
  @override
  late final GeneratedColumn<String> categories = GeneratedColumn<String>(
    'categories',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deweyDecimalNumberMeta =
      const VerificationMeta('deweyDecimalNumber');
  @override
  late final GeneratedColumn<String> deweyDecimalNumber =
      GeneratedColumn<String>(
        'dewey_decimal_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _bisacCategoryMeta = const VerificationMeta(
    'bisacCategory',
  );
  @override
  late final GeneratedColumn<String> bisacCategory = GeneratedColumn<String>(
    'bisac_category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bisacSubcategoryMeta = const VerificationMeta(
    'bisacSubcategory',
  );
  @override
  late final GeneratedColumn<String> bisacSubcategory = GeneratedColumn<String>(
    'bisac_subcategory',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shelfIdMeta = const VerificationMeta(
    'shelfId',
  );
  @override
  late final GeneratedColumn<String> shelfId = GeneratedColumn<String>(
    'shelf_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _relatedBookIdsMeta = const VerificationMeta(
    'relatedBookIds',
  );
  @override
  late final GeneratedColumn<String> relatedBookIds = GeneratedColumn<String>(
    'related_book_ids',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _loanedToMeta = const VerificationMeta(
    'loanedTo',
  );
  @override
  late final GeneratedColumn<String> loanedTo = GeneratedColumn<String>(
    'loaned_to',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loanDateMeta = const VerificationMeta(
    'loanDate',
  );
  @override
  late final GeneratedColumn<DateTime> loanDate = GeneratedColumn<DateTime>(
    'loan_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userRatingMeta = const VerificationMeta(
    'userRating',
  );
  @override
  late final GeneratedColumn<int> userRating = GeneratedColumn<int>(
    'user_rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateReadMeta = const VerificationMeta(
    'dateRead',
  );
  @override
  late final GeneratedColumn<DateTime> dateRead = GeneratedColumn<DateTime>(
    'date_read',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readingStatusMeta = const VerificationMeta(
    'readingStatus',
  );
  @override
  late final GeneratedColumn<String> readingStatus = GeneratedColumn<String>(
    'reading_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    isbn,
    title,
    subtitle,
    authors,
    publisher,
    publishedDate,
    bookDescription,
    coverImageData,
    coverImageUrl,
    pageCount,
    categories,
    language,
    dateAdded,
    deweyDecimalNumber,
    bisacCategory,
    bisacSubcategory,
    shelfId,
    notes,
    tags,
    relatedBookIds,
    loanedTo,
    loanDate,
    userRating,
    dateRead,
    readingStatus,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'books';
  @override
  VerificationContext validateIntegrity(
    Insertable<BookEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('isbn')) {
      context.handle(
        _isbnMeta,
        isbn.isAcceptableOrUnknown(data['isbn']!, _isbnMeta),
      );
    } else if (isInserting) {
      context.missing(_isbnMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    }
    if (data.containsKey('authors')) {
      context.handle(
        _authorsMeta,
        authors.isAcceptableOrUnknown(data['authors']!, _authorsMeta),
      );
    }
    if (data.containsKey('publisher')) {
      context.handle(
        _publisherMeta,
        publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta),
      );
    }
    if (data.containsKey('published_date')) {
      context.handle(
        _publishedDateMeta,
        publishedDate.isAcceptableOrUnknown(
          data['published_date']!,
          _publishedDateMeta,
        ),
      );
    }
    if (data.containsKey('book_description')) {
      context.handle(
        _bookDescriptionMeta,
        bookDescription.isAcceptableOrUnknown(
          data['book_description']!,
          _bookDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('cover_image_data')) {
      context.handle(
        _coverImageDataMeta,
        coverImageData.isAcceptableOrUnknown(
          data['cover_image_data']!,
          _coverImageDataMeta,
        ),
      );
    }
    if (data.containsKey('cover_image_url')) {
      context.handle(
        _coverImageUrlMeta,
        coverImageUrl.isAcceptableOrUnknown(
          data['cover_image_url']!,
          _coverImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    }
    if (data.containsKey('categories')) {
      context.handle(
        _categoriesMeta,
        categories.isAcceptableOrUnknown(data['categories']!, _categoriesMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    } else if (isInserting) {
      context.missing(_dateAddedMeta);
    }
    if (data.containsKey('dewey_decimal_number')) {
      context.handle(
        _deweyDecimalNumberMeta,
        deweyDecimalNumber.isAcceptableOrUnknown(
          data['dewey_decimal_number']!,
          _deweyDecimalNumberMeta,
        ),
      );
    }
    if (data.containsKey('bisac_category')) {
      context.handle(
        _bisacCategoryMeta,
        bisacCategory.isAcceptableOrUnknown(
          data['bisac_category']!,
          _bisacCategoryMeta,
        ),
      );
    }
    if (data.containsKey('bisac_subcategory')) {
      context.handle(
        _bisacSubcategoryMeta,
        bisacSubcategory.isAcceptableOrUnknown(
          data['bisac_subcategory']!,
          _bisacSubcategoryMeta,
        ),
      );
    }
    if (data.containsKey('shelf_id')) {
      context.handle(
        _shelfIdMeta,
        shelfId.isAcceptableOrUnknown(data['shelf_id']!, _shelfIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('related_book_ids')) {
      context.handle(
        _relatedBookIdsMeta,
        relatedBookIds.isAcceptableOrUnknown(
          data['related_book_ids']!,
          _relatedBookIdsMeta,
        ),
      );
    }
    if (data.containsKey('loaned_to')) {
      context.handle(
        _loanedToMeta,
        loanedTo.isAcceptableOrUnknown(data['loaned_to']!, _loanedToMeta),
      );
    }
    if (data.containsKey('loan_date')) {
      context.handle(
        _loanDateMeta,
        loanDate.isAcceptableOrUnknown(data['loan_date']!, _loanDateMeta),
      );
    }
    if (data.containsKey('user_rating')) {
      context.handle(
        _userRatingMeta,
        userRating.isAcceptableOrUnknown(data['user_rating']!, _userRatingMeta),
      );
    }
    if (data.containsKey('date_read')) {
      context.handle(
        _dateReadMeta,
        dateRead.isAcceptableOrUnknown(data['date_read']!, _dateReadMeta),
      );
    }
    if (data.containsKey('reading_status')) {
      context.handle(
        _readingStatusMeta,
        readingStatus.isAcceptableOrUnknown(
          data['reading_status']!,
          _readingStatusMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      isbn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}isbn'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      ),
      authors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}authors'],
      )!,
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher'],
      ),
      publishedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}published_date'],
      ),
      bookDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}book_description'],
      ),
      coverImageData: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}cover_image_data'],
      ),
      coverImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_url'],
      ),
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      ),
      categories: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categories'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      )!,
      deweyDecimalNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dewey_decimal_number'],
      ),
      bisacCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bisac_category'],
      ),
      bisacSubcategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bisac_subcategory'],
      ),
      shelfId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shelf_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      relatedBookIds: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_book_ids'],
      )!,
      loanedTo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}loaned_to'],
      ),
      loanDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}loan_date'],
      ),
      userRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_rating'],
      ),
      dateRead: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_read'],
      ),
      readingStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reading_status'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $BooksTable createAlias(String alias) {
    return $BooksTable(attachedDatabase, alias);
  }
}

class BookEntity extends DataClass implements Insertable<BookEntity> {
  /// Unique identifier for the book.
  final String id;

  /// ISBN (ISBN-10 or ISBN-13).
  final String isbn;

  /// Book title.
  final String title;

  /// Optional subtitle.
  final String? subtitle;

  /// List of authors as JSON array.
  final String authors;

  /// Publisher name.
  final String? publisher;

  /// Publication date as string.
  final String? publishedDate;

  /// Book description/summary.
  final String? bookDescription;

  /// Cover image stored as bytes.
  final Uint8List? coverImageData;

  /// Cover image URL from API.
  final String? coverImageUrl;

  /// Number of pages.
  final int? pageCount;

  /// Categories/genres as JSON array.
  final String categories;

  /// Language code (e.g., 'en').
  final String? language;

  /// When the book was added to the library.
  final DateTime dateAdded;

  /// Dewey Decimal classification number.
  final String? deweyDecimalNumber;

  /// BISAC category (AI-generated, premium feature).
  final String? bisacCategory;

  /// BISAC subcategory (AI-generated, premium feature).
  final String? bisacSubcategory;

  /// ID of the shelf this book belongs to.
  final String? shelfId;

  /// User's personal notes about the book.
  final String? notes;

  /// User-defined tags as JSON array.
  final String tags;

  /// IDs of related books as JSON array.
  final String relatedBookIds;

  /// Name of person who borrowed this book.
  final String? loanedTo;

  /// Date when the book was loaned out.
  final DateTime? loanDate;

  /// User's rating (1-5 stars).
  final int? userRating;

  /// Date when the user finished reading.
  final DateTime? dateRead;

  /// Current reading status as string.
  final String? readingStatus;

  /// Last time this book was updated.
  final DateTime updatedAt;

  /// Whether this book has been synced to the cloud.
  final bool isSynced;
  const BookEntity({
    required this.id,
    required this.isbn,
    required this.title,
    this.subtitle,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.bookDescription,
    this.coverImageData,
    this.coverImageUrl,
    this.pageCount,
    required this.categories,
    this.language,
    required this.dateAdded,
    this.deweyDecimalNumber,
    this.bisacCategory,
    this.bisacSubcategory,
    this.shelfId,
    this.notes,
    required this.tags,
    required this.relatedBookIds,
    this.loanedTo,
    this.loanDate,
    this.userRating,
    this.dateRead,
    this.readingStatus,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['isbn'] = Variable<String>(isbn);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    map['authors'] = Variable<String>(authors);
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || publishedDate != null) {
      map['published_date'] = Variable<String>(publishedDate);
    }
    if (!nullToAbsent || bookDescription != null) {
      map['book_description'] = Variable<String>(bookDescription);
    }
    if (!nullToAbsent || coverImageData != null) {
      map['cover_image_data'] = Variable<Uint8List>(coverImageData);
    }
    if (!nullToAbsent || coverImageUrl != null) {
      map['cover_image_url'] = Variable<String>(coverImageUrl);
    }
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    map['categories'] = Variable<String>(categories);
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    map['date_added'] = Variable<DateTime>(dateAdded);
    if (!nullToAbsent || deweyDecimalNumber != null) {
      map['dewey_decimal_number'] = Variable<String>(deweyDecimalNumber);
    }
    if (!nullToAbsent || bisacCategory != null) {
      map['bisac_category'] = Variable<String>(bisacCategory);
    }
    if (!nullToAbsent || bisacSubcategory != null) {
      map['bisac_subcategory'] = Variable<String>(bisacSubcategory);
    }
    if (!nullToAbsent || shelfId != null) {
      map['shelf_id'] = Variable<String>(shelfId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['tags'] = Variable<String>(tags);
    map['related_book_ids'] = Variable<String>(relatedBookIds);
    if (!nullToAbsent || loanedTo != null) {
      map['loaned_to'] = Variable<String>(loanedTo);
    }
    if (!nullToAbsent || loanDate != null) {
      map['loan_date'] = Variable<DateTime>(loanDate);
    }
    if (!nullToAbsent || userRating != null) {
      map['user_rating'] = Variable<int>(userRating);
    }
    if (!nullToAbsent || dateRead != null) {
      map['date_read'] = Variable<DateTime>(dateRead);
    }
    if (!nullToAbsent || readingStatus != null) {
      map['reading_status'] = Variable<String>(readingStatus);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  BooksCompanion toCompanion(bool nullToAbsent) {
    return BooksCompanion(
      id: Value(id),
      isbn: Value(isbn),
      title: Value(title),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      authors: Value(authors),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      publishedDate: publishedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedDate),
      bookDescription: bookDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(bookDescription),
      coverImageData: coverImageData == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageData),
      coverImageUrl: coverImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageUrl),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      categories: Value(categories),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      dateAdded: Value(dateAdded),
      deweyDecimalNumber: deweyDecimalNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(deweyDecimalNumber),
      bisacCategory: bisacCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(bisacCategory),
      bisacSubcategory: bisacSubcategory == null && nullToAbsent
          ? const Value.absent()
          : Value(bisacSubcategory),
      shelfId: shelfId == null && nullToAbsent
          ? const Value.absent()
          : Value(shelfId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      tags: Value(tags),
      relatedBookIds: Value(relatedBookIds),
      loanedTo: loanedTo == null && nullToAbsent
          ? const Value.absent()
          : Value(loanedTo),
      loanDate: loanDate == null && nullToAbsent
          ? const Value.absent()
          : Value(loanDate),
      userRating: userRating == null && nullToAbsent
          ? const Value.absent()
          : Value(userRating),
      dateRead: dateRead == null && nullToAbsent
          ? const Value.absent()
          : Value(dateRead),
      readingStatus: readingStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(readingStatus),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory BookEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookEntity(
      id: serializer.fromJson<String>(json['id']),
      isbn: serializer.fromJson<String>(json['isbn']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      authors: serializer.fromJson<String>(json['authors']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      publishedDate: serializer.fromJson<String?>(json['publishedDate']),
      bookDescription: serializer.fromJson<String?>(json['bookDescription']),
      coverImageData: serializer.fromJson<Uint8List?>(json['coverImageData']),
      coverImageUrl: serializer.fromJson<String?>(json['coverImageUrl']),
      pageCount: serializer.fromJson<int?>(json['pageCount']),
      categories: serializer.fromJson<String>(json['categories']),
      language: serializer.fromJson<String?>(json['language']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      deweyDecimalNumber: serializer.fromJson<String?>(
        json['deweyDecimalNumber'],
      ),
      bisacCategory: serializer.fromJson<String?>(json['bisacCategory']),
      bisacSubcategory: serializer.fromJson<String?>(json['bisacSubcategory']),
      shelfId: serializer.fromJson<String?>(json['shelfId']),
      notes: serializer.fromJson<String?>(json['notes']),
      tags: serializer.fromJson<String>(json['tags']),
      relatedBookIds: serializer.fromJson<String>(json['relatedBookIds']),
      loanedTo: serializer.fromJson<String?>(json['loanedTo']),
      loanDate: serializer.fromJson<DateTime?>(json['loanDate']),
      userRating: serializer.fromJson<int?>(json['userRating']),
      dateRead: serializer.fromJson<DateTime?>(json['dateRead']),
      readingStatus: serializer.fromJson<String?>(json['readingStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'isbn': serializer.toJson<String>(isbn),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String?>(subtitle),
      'authors': serializer.toJson<String>(authors),
      'publisher': serializer.toJson<String?>(publisher),
      'publishedDate': serializer.toJson<String?>(publishedDate),
      'bookDescription': serializer.toJson<String?>(bookDescription),
      'coverImageData': serializer.toJson<Uint8List?>(coverImageData),
      'coverImageUrl': serializer.toJson<String?>(coverImageUrl),
      'pageCount': serializer.toJson<int?>(pageCount),
      'categories': serializer.toJson<String>(categories),
      'language': serializer.toJson<String?>(language),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'deweyDecimalNumber': serializer.toJson<String?>(deweyDecimalNumber),
      'bisacCategory': serializer.toJson<String?>(bisacCategory),
      'bisacSubcategory': serializer.toJson<String?>(bisacSubcategory),
      'shelfId': serializer.toJson<String?>(shelfId),
      'notes': serializer.toJson<String?>(notes),
      'tags': serializer.toJson<String>(tags),
      'relatedBookIds': serializer.toJson<String>(relatedBookIds),
      'loanedTo': serializer.toJson<String?>(loanedTo),
      'loanDate': serializer.toJson<DateTime?>(loanDate),
      'userRating': serializer.toJson<int?>(userRating),
      'dateRead': serializer.toJson<DateTime?>(dateRead),
      'readingStatus': serializer.toJson<String?>(readingStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  BookEntity copyWith({
    String? id,
    String? isbn,
    String? title,
    Value<String?> subtitle = const Value.absent(),
    String? authors,
    Value<String?> publisher = const Value.absent(),
    Value<String?> publishedDate = const Value.absent(),
    Value<String?> bookDescription = const Value.absent(),
    Value<Uint8List?> coverImageData = const Value.absent(),
    Value<String?> coverImageUrl = const Value.absent(),
    Value<int?> pageCount = const Value.absent(),
    String? categories,
    Value<String?> language = const Value.absent(),
    DateTime? dateAdded,
    Value<String?> deweyDecimalNumber = const Value.absent(),
    Value<String?> bisacCategory = const Value.absent(),
    Value<String?> bisacSubcategory = const Value.absent(),
    Value<String?> shelfId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? tags,
    String? relatedBookIds,
    Value<String?> loanedTo = const Value.absent(),
    Value<DateTime?> loanDate = const Value.absent(),
    Value<int?> userRating = const Value.absent(),
    Value<DateTime?> dateRead = const Value.absent(),
    Value<String?> readingStatus = const Value.absent(),
    DateTime? updatedAt,
    bool? isSynced,
  }) => BookEntity(
    id: id ?? this.id,
    isbn: isbn ?? this.isbn,
    title: title ?? this.title,
    subtitle: subtitle.present ? subtitle.value : this.subtitle,
    authors: authors ?? this.authors,
    publisher: publisher.present ? publisher.value : this.publisher,
    publishedDate: publishedDate.present
        ? publishedDate.value
        : this.publishedDate,
    bookDescription: bookDescription.present
        ? bookDescription.value
        : this.bookDescription,
    coverImageData: coverImageData.present
        ? coverImageData.value
        : this.coverImageData,
    coverImageUrl: coverImageUrl.present
        ? coverImageUrl.value
        : this.coverImageUrl,
    pageCount: pageCount.present ? pageCount.value : this.pageCount,
    categories: categories ?? this.categories,
    language: language.present ? language.value : this.language,
    dateAdded: dateAdded ?? this.dateAdded,
    deweyDecimalNumber: deweyDecimalNumber.present
        ? deweyDecimalNumber.value
        : this.deweyDecimalNumber,
    bisacCategory: bisacCategory.present
        ? bisacCategory.value
        : this.bisacCategory,
    bisacSubcategory: bisacSubcategory.present
        ? bisacSubcategory.value
        : this.bisacSubcategory,
    shelfId: shelfId.present ? shelfId.value : this.shelfId,
    notes: notes.present ? notes.value : this.notes,
    tags: tags ?? this.tags,
    relatedBookIds: relatedBookIds ?? this.relatedBookIds,
    loanedTo: loanedTo.present ? loanedTo.value : this.loanedTo,
    loanDate: loanDate.present ? loanDate.value : this.loanDate,
    userRating: userRating.present ? userRating.value : this.userRating,
    dateRead: dateRead.present ? dateRead.value : this.dateRead,
    readingStatus: readingStatus.present
        ? readingStatus.value
        : this.readingStatus,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  BookEntity copyWithCompanion(BooksCompanion data) {
    return BookEntity(
      id: data.id.present ? data.id.value : this.id,
      isbn: data.isbn.present ? data.isbn.value : this.isbn,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      authors: data.authors.present ? data.authors.value : this.authors,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      publishedDate: data.publishedDate.present
          ? data.publishedDate.value
          : this.publishedDate,
      bookDescription: data.bookDescription.present
          ? data.bookDescription.value
          : this.bookDescription,
      coverImageData: data.coverImageData.present
          ? data.coverImageData.value
          : this.coverImageData,
      coverImageUrl: data.coverImageUrl.present
          ? data.coverImageUrl.value
          : this.coverImageUrl,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      categories: data.categories.present
          ? data.categories.value
          : this.categories,
      language: data.language.present ? data.language.value : this.language,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      deweyDecimalNumber: data.deweyDecimalNumber.present
          ? data.deweyDecimalNumber.value
          : this.deweyDecimalNumber,
      bisacCategory: data.bisacCategory.present
          ? data.bisacCategory.value
          : this.bisacCategory,
      bisacSubcategory: data.bisacSubcategory.present
          ? data.bisacSubcategory.value
          : this.bisacSubcategory,
      shelfId: data.shelfId.present ? data.shelfId.value : this.shelfId,
      notes: data.notes.present ? data.notes.value : this.notes,
      tags: data.tags.present ? data.tags.value : this.tags,
      relatedBookIds: data.relatedBookIds.present
          ? data.relatedBookIds.value
          : this.relatedBookIds,
      loanedTo: data.loanedTo.present ? data.loanedTo.value : this.loanedTo,
      loanDate: data.loanDate.present ? data.loanDate.value : this.loanDate,
      userRating: data.userRating.present
          ? data.userRating.value
          : this.userRating,
      dateRead: data.dateRead.present ? data.dateRead.value : this.dateRead,
      readingStatus: data.readingStatus.present
          ? data.readingStatus.value
          : this.readingStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookEntity(')
          ..write('id: $id, ')
          ..write('isbn: $isbn, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('authors: $authors, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('bookDescription: $bookDescription, ')
          ..write('coverImageData: $coverImageData, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('pageCount: $pageCount, ')
          ..write('categories: $categories, ')
          ..write('language: $language, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('deweyDecimalNumber: $deweyDecimalNumber, ')
          ..write('bisacCategory: $bisacCategory, ')
          ..write('bisacSubcategory: $bisacSubcategory, ')
          ..write('shelfId: $shelfId, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('relatedBookIds: $relatedBookIds, ')
          ..write('loanedTo: $loanedTo, ')
          ..write('loanDate: $loanDate, ')
          ..write('userRating: $userRating, ')
          ..write('dateRead: $dateRead, ')
          ..write('readingStatus: $readingStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    isbn,
    title,
    subtitle,
    authors,
    publisher,
    publishedDate,
    bookDescription,
    $driftBlobEquality.hash(coverImageData),
    coverImageUrl,
    pageCount,
    categories,
    language,
    dateAdded,
    deweyDecimalNumber,
    bisacCategory,
    bisacSubcategory,
    shelfId,
    notes,
    tags,
    relatedBookIds,
    loanedTo,
    loanDate,
    userRating,
    dateRead,
    readingStatus,
    updatedAt,
    isSynced,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookEntity &&
          other.id == this.id &&
          other.isbn == this.isbn &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.authors == this.authors &&
          other.publisher == this.publisher &&
          other.publishedDate == this.publishedDate &&
          other.bookDescription == this.bookDescription &&
          $driftBlobEquality.equals(
            other.coverImageData,
            this.coverImageData,
          ) &&
          other.coverImageUrl == this.coverImageUrl &&
          other.pageCount == this.pageCount &&
          other.categories == this.categories &&
          other.language == this.language &&
          other.dateAdded == this.dateAdded &&
          other.deweyDecimalNumber == this.deweyDecimalNumber &&
          other.bisacCategory == this.bisacCategory &&
          other.bisacSubcategory == this.bisacSubcategory &&
          other.shelfId == this.shelfId &&
          other.notes == this.notes &&
          other.tags == this.tags &&
          other.relatedBookIds == this.relatedBookIds &&
          other.loanedTo == this.loanedTo &&
          other.loanDate == this.loanDate &&
          other.userRating == this.userRating &&
          other.dateRead == this.dateRead &&
          other.readingStatus == this.readingStatus &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class BooksCompanion extends UpdateCompanion<BookEntity> {
  final Value<String> id;
  final Value<String> isbn;
  final Value<String> title;
  final Value<String?> subtitle;
  final Value<String> authors;
  final Value<String?> publisher;
  final Value<String?> publishedDate;
  final Value<String?> bookDescription;
  final Value<Uint8List?> coverImageData;
  final Value<String?> coverImageUrl;
  final Value<int?> pageCount;
  final Value<String> categories;
  final Value<String?> language;
  final Value<DateTime> dateAdded;
  final Value<String?> deweyDecimalNumber;
  final Value<String?> bisacCategory;
  final Value<String?> bisacSubcategory;
  final Value<String?> shelfId;
  final Value<String?> notes;
  final Value<String> tags;
  final Value<String> relatedBookIds;
  final Value<String?> loanedTo;
  final Value<DateTime?> loanDate;
  final Value<int?> userRating;
  final Value<DateTime?> dateRead;
  final Value<String?> readingStatus;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const BooksCompanion({
    this.id = const Value.absent(),
    this.isbn = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.authors = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.bookDescription = const Value.absent(),
    this.coverImageData = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.categories = const Value.absent(),
    this.language = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.deweyDecimalNumber = const Value.absent(),
    this.bisacCategory = const Value.absent(),
    this.bisacSubcategory = const Value.absent(),
    this.shelfId = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.relatedBookIds = const Value.absent(),
    this.loanedTo = const Value.absent(),
    this.loanDate = const Value.absent(),
    this.userRating = const Value.absent(),
    this.dateRead = const Value.absent(),
    this.readingStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BooksCompanion.insert({
    required String id,
    required String isbn,
    required String title,
    this.subtitle = const Value.absent(),
    this.authors = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.bookDescription = const Value.absent(),
    this.coverImageData = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.categories = const Value.absent(),
    this.language = const Value.absent(),
    required DateTime dateAdded,
    this.deweyDecimalNumber = const Value.absent(),
    this.bisacCategory = const Value.absent(),
    this.bisacSubcategory = const Value.absent(),
    this.shelfId = const Value.absent(),
    this.notes = const Value.absent(),
    this.tags = const Value.absent(),
    this.relatedBookIds = const Value.absent(),
    this.loanedTo = const Value.absent(),
    this.loanDate = const Value.absent(),
    this.userRating = const Value.absent(),
    this.dateRead = const Value.absent(),
    this.readingStatus = const Value.absent(),
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       isbn = Value(isbn),
       title = Value(title),
       dateAdded = Value(dateAdded),
       updatedAt = Value(updatedAt);
  static Insertable<BookEntity> custom({
    Expression<String>? id,
    Expression<String>? isbn,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? authors,
    Expression<String>? publisher,
    Expression<String>? publishedDate,
    Expression<String>? bookDescription,
    Expression<Uint8List>? coverImageData,
    Expression<String>? coverImageUrl,
    Expression<int>? pageCount,
    Expression<String>? categories,
    Expression<String>? language,
    Expression<DateTime>? dateAdded,
    Expression<String>? deweyDecimalNumber,
    Expression<String>? bisacCategory,
    Expression<String>? bisacSubcategory,
    Expression<String>? shelfId,
    Expression<String>? notes,
    Expression<String>? tags,
    Expression<String>? relatedBookIds,
    Expression<String>? loanedTo,
    Expression<DateTime>? loanDate,
    Expression<int>? userRating,
    Expression<DateTime>? dateRead,
    Expression<String>? readingStatus,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isbn != null) 'isbn': isbn,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (authors != null) 'authors': authors,
      if (publisher != null) 'publisher': publisher,
      if (publishedDate != null) 'published_date': publishedDate,
      if (bookDescription != null) 'book_description': bookDescription,
      if (coverImageData != null) 'cover_image_data': coverImageData,
      if (coverImageUrl != null) 'cover_image_url': coverImageUrl,
      if (pageCount != null) 'page_count': pageCount,
      if (categories != null) 'categories': categories,
      if (language != null) 'language': language,
      if (dateAdded != null) 'date_added': dateAdded,
      if (deweyDecimalNumber != null)
        'dewey_decimal_number': deweyDecimalNumber,
      if (bisacCategory != null) 'bisac_category': bisacCategory,
      if (bisacSubcategory != null) 'bisac_subcategory': bisacSubcategory,
      if (shelfId != null) 'shelf_id': shelfId,
      if (notes != null) 'notes': notes,
      if (tags != null) 'tags': tags,
      if (relatedBookIds != null) 'related_book_ids': relatedBookIds,
      if (loanedTo != null) 'loaned_to': loanedTo,
      if (loanDate != null) 'loan_date': loanDate,
      if (userRating != null) 'user_rating': userRating,
      if (dateRead != null) 'date_read': dateRead,
      if (readingStatus != null) 'reading_status': readingStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BooksCompanion copyWith({
    Value<String>? id,
    Value<String>? isbn,
    Value<String>? title,
    Value<String?>? subtitle,
    Value<String>? authors,
    Value<String?>? publisher,
    Value<String?>? publishedDate,
    Value<String?>? bookDescription,
    Value<Uint8List?>? coverImageData,
    Value<String?>? coverImageUrl,
    Value<int?>? pageCount,
    Value<String>? categories,
    Value<String?>? language,
    Value<DateTime>? dateAdded,
    Value<String?>? deweyDecimalNumber,
    Value<String?>? bisacCategory,
    Value<String?>? bisacSubcategory,
    Value<String?>? shelfId,
    Value<String?>? notes,
    Value<String>? tags,
    Value<String>? relatedBookIds,
    Value<String?>? loanedTo,
    Value<DateTime?>? loanDate,
    Value<int?>? userRating,
    Value<DateTime?>? dateRead,
    Value<String?>? readingStatus,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return BooksCompanion(
      id: id ?? this.id,
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      bookDescription: bookDescription ?? this.bookDescription,
      coverImageData: coverImageData ?? this.coverImageData,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
      language: language ?? this.language,
      dateAdded: dateAdded ?? this.dateAdded,
      deweyDecimalNumber: deweyDecimalNumber ?? this.deweyDecimalNumber,
      bisacCategory: bisacCategory ?? this.bisacCategory,
      bisacSubcategory: bisacSubcategory ?? this.bisacSubcategory,
      shelfId: shelfId ?? this.shelfId,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
      relatedBookIds: relatedBookIds ?? this.relatedBookIds,
      loanedTo: loanedTo ?? this.loanedTo,
      loanDate: loanDate ?? this.loanDate,
      userRating: userRating ?? this.userRating,
      dateRead: dateRead ?? this.dateRead,
      readingStatus: readingStatus ?? this.readingStatus,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (isbn.present) {
      map['isbn'] = Variable<String>(isbn.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (bookDescription.present) {
      map['book_description'] = Variable<String>(bookDescription.value);
    }
    if (coverImageData.present) {
      map['cover_image_data'] = Variable<Uint8List>(coverImageData.value);
    }
    if (coverImageUrl.present) {
      map['cover_image_url'] = Variable<String>(coverImageUrl.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(categories.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (deweyDecimalNumber.present) {
      map['dewey_decimal_number'] = Variable<String>(deweyDecimalNumber.value);
    }
    if (bisacCategory.present) {
      map['bisac_category'] = Variable<String>(bisacCategory.value);
    }
    if (bisacSubcategory.present) {
      map['bisac_subcategory'] = Variable<String>(bisacSubcategory.value);
    }
    if (shelfId.present) {
      map['shelf_id'] = Variable<String>(shelfId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (relatedBookIds.present) {
      map['related_book_ids'] = Variable<String>(relatedBookIds.value);
    }
    if (loanedTo.present) {
      map['loaned_to'] = Variable<String>(loanedTo.value);
    }
    if (loanDate.present) {
      map['loan_date'] = Variable<DateTime>(loanDate.value);
    }
    if (userRating.present) {
      map['user_rating'] = Variable<int>(userRating.value);
    }
    if (dateRead.present) {
      map['date_read'] = Variable<DateTime>(dateRead.value);
    }
    if (readingStatus.present) {
      map['reading_status'] = Variable<String>(readingStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksCompanion(')
          ..write('id: $id, ')
          ..write('isbn: $isbn, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('authors: $authors, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('bookDescription: $bookDescription, ')
          ..write('coverImageData: $coverImageData, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('pageCount: $pageCount, ')
          ..write('categories: $categories, ')
          ..write('language: $language, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('deweyDecimalNumber: $deweyDecimalNumber, ')
          ..write('bisacCategory: $bisacCategory, ')
          ..write('bisacSubcategory: $bisacSubcategory, ')
          ..write('shelfId: $shelfId, ')
          ..write('notes: $notes, ')
          ..write('tags: $tags, ')
          ..write('relatedBookIds: $relatedBookIds, ')
          ..write('loanedTo: $loanedTo, ')
          ..write('loanDate: $loanDate, ')
          ..write('userRating: $userRating, ')
          ..write('dateRead: $dateRead, ')
          ..write('readingStatus: $readingStatus, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShelvesTable extends Shelves with TableInfo<$ShelvesTable, ShelfEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShelvesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<String> roomId = GeneratedColumn<String>(
    'room_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    roomId,
    dateCreated,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shelves';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShelfEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShelfEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShelfEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room_id'],
      ),
      dateCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_created'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ShelvesTable createAlias(String alias) {
    return $ShelvesTable(attachedDatabase, alias);
  }
}

class ShelfEntity extends DataClass implements Insertable<ShelfEntity> {
  /// Unique identifier for the shelf.
  final String id;

  /// Display name of the shelf.
  final String name;

  /// Optional room ID this shelf belongs to.
  final String? roomId;

  /// When the shelf was created.
  final DateTime dateCreated;

  /// Last time this shelf was updated.
  final DateTime updatedAt;

  /// Whether this shelf has been synced to the cloud.
  final bool isSynced;
  const ShelfEntity({
    required this.id,
    required this.name,
    this.roomId,
    required this.dateCreated,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || roomId != null) {
      map['room_id'] = Variable<String>(roomId);
    }
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ShelvesCompanion toCompanion(bool nullToAbsent) {
    return ShelvesCompanion(
      id: Value(id),
      name: Value(name),
      roomId: roomId == null && nullToAbsent
          ? const Value.absent()
          : Value(roomId),
      dateCreated: Value(dateCreated),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory ShelfEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShelfEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      roomId: serializer.fromJson<String?>(json['roomId']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'roomId': serializer.toJson<String?>(roomId),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  ShelfEntity copyWith({
    String? id,
    String? name,
    Value<String?> roomId = const Value.absent(),
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isSynced,
  }) => ShelfEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    roomId: roomId.present ? roomId.value : this.roomId,
    dateCreated: dateCreated ?? this.dateCreated,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  ShelfEntity copyWithCompanion(ShelvesCompanion data) {
    return ShelfEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      dateCreated: data.dateCreated.present
          ? data.dateCreated.value
          : this.dateCreated,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShelfEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('roomId: $roomId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, roomId, dateCreated, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShelfEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.roomId == this.roomId &&
          other.dateCreated == this.dateCreated &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class ShelvesCompanion extends UpdateCompanion<ShelfEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> roomId;
  final Value<DateTime> dateCreated;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ShelvesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.roomId = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShelvesCompanion.insert({
    required String id,
    required String name,
    this.roomId = const Value.absent(),
    required DateTime dateCreated,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       dateCreated = Value(dateCreated),
       updatedAt = Value(updatedAt);
  static Insertable<ShelfEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? roomId,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (roomId != null) 'room_id': roomId,
      if (dateCreated != null) 'date_created': dateCreated,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShelvesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? roomId,
    Value<DateTime>? dateCreated,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ShelvesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      roomId: roomId ?? this.roomId,
      dateCreated: dateCreated ?? this.dateCreated,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<String>(roomId.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShelvesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('roomId: $roomId, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, RoomEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    dateCreated,
    updatedAt,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoomEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dateCreated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_created'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class RoomEntity extends DataClass implements Insertable<RoomEntity> {
  /// Unique identifier for the room.
  final String id;

  /// Display name of the room.
  final String name;

  /// When the room was created.
  final DateTime dateCreated;

  /// Last time this room was updated.
  final DateTime updatedAt;

  /// Whether this room has been synced to the cloud.
  final bool isSynced;
  const RoomEntity({
    required this.id,
    required this.name,
    required this.dateCreated,
    required this.updatedAt,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['date_created'] = Variable<DateTime>(dateCreated);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      dateCreated: Value(dateCreated),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
    );
  }

  factory RoomEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  RoomEntity copyWith({
    String? id,
    String? name,
    DateTime? dateCreated,
    DateTime? updatedAt,
    bool? isSynced,
  }) => RoomEntity(
    id: id ?? this.id,
    name: name ?? this.name,
    dateCreated: dateCreated ?? this.dateCreated,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
  );
  RoomEntity copyWithCompanion(RoomsCompanion data) {
    return RoomEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      dateCreated: data.dateCreated.present
          ? data.dateCreated.value
          : this.dateCreated,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, dateCreated, updatedAt, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.dateCreated == this.dateCreated &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced);
}

class RoomsCompanion extends UpdateCompanion<RoomEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> dateCreated;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoomsCompanion.insert({
    required String id,
    required String name,
    required DateTime dateCreated,
    required DateTime updatedAt,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       dateCreated = Value(dateCreated),
       updatedAt = Value(updatedAt);
  static Insertable<RoomEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? dateCreated,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dateCreated != null) 'date_created': dateCreated,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoomsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? dateCreated,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dateCreated: dateCreated ?? this.dateCreated,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BooksTable books = $BooksTable(this);
  late final $ShelvesTable shelves = $ShelvesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final BooksDao booksDao = BooksDao(this as AppDatabase);
  late final ShelvesDao shelvesDao = ShelvesDao(this as AppDatabase);
  late final RoomsDao roomsDao = RoomsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [books, shelves, rooms];
}

typedef $$BooksTableCreateCompanionBuilder =
    BooksCompanion Function({
      required String id,
      required String isbn,
      required String title,
      Value<String?> subtitle,
      Value<String> authors,
      Value<String?> publisher,
      Value<String?> publishedDate,
      Value<String?> bookDescription,
      Value<Uint8List?> coverImageData,
      Value<String?> coverImageUrl,
      Value<int?> pageCount,
      Value<String> categories,
      Value<String?> language,
      required DateTime dateAdded,
      Value<String?> deweyDecimalNumber,
      Value<String?> bisacCategory,
      Value<String?> bisacSubcategory,
      Value<String?> shelfId,
      Value<String?> notes,
      Value<String> tags,
      Value<String> relatedBookIds,
      Value<String?> loanedTo,
      Value<DateTime?> loanDate,
      Value<int?> userRating,
      Value<DateTime?> dateRead,
      Value<String?> readingStatus,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$BooksTableUpdateCompanionBuilder =
    BooksCompanion Function({
      Value<String> id,
      Value<String> isbn,
      Value<String> title,
      Value<String?> subtitle,
      Value<String> authors,
      Value<String?> publisher,
      Value<String?> publishedDate,
      Value<String?> bookDescription,
      Value<Uint8List?> coverImageData,
      Value<String?> coverImageUrl,
      Value<int?> pageCount,
      Value<String> categories,
      Value<String?> language,
      Value<DateTime> dateAdded,
      Value<String?> deweyDecimalNumber,
      Value<String?> bisacCategory,
      Value<String?> bisacSubcategory,
      Value<String?> shelfId,
      Value<String?> notes,
      Value<String> tags,
      Value<String> relatedBookIds,
      Value<String?> loanedTo,
      Value<DateTime?> loanDate,
      Value<int?> userRating,
      Value<DateTime?> dateRead,
      Value<String?> readingStatus,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$BooksTableFilterComposer extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get isbn => $composableBuilder(
    column: $table.isbn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookDescription => $composableBuilder(
    column: $table.bookDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get coverImageData => $composableBuilder(
    column: $table.coverImageData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deweyDecimalNumber => $composableBuilder(
    column: $table.deweyDecimalNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bisacCategory => $composableBuilder(
    column: $table.bisacCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bisacSubcategory => $composableBuilder(
    column: $table.bisacSubcategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shelfId => $composableBuilder(
    column: $table.shelfId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedBookIds => $composableBuilder(
    column: $table.relatedBookIds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get loanedTo => $composableBuilder(
    column: $table.loanedTo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loanDate => $composableBuilder(
    column: $table.loanDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateRead => $composableBuilder(
    column: $table.dateRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get readingStatus => $composableBuilder(
    column: $table.readingStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BooksTableOrderingComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get isbn => $composableBuilder(
    column: $table.isbn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authors => $composableBuilder(
    column: $table.authors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookDescription => $composableBuilder(
    column: $table.bookDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get coverImageData => $composableBuilder(
    column: $table.coverImageData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deweyDecimalNumber => $composableBuilder(
    column: $table.deweyDecimalNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bisacCategory => $composableBuilder(
    column: $table.bisacCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bisacSubcategory => $composableBuilder(
    column: $table.bisacSubcategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shelfId => $composableBuilder(
    column: $table.shelfId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedBookIds => $composableBuilder(
    column: $table.relatedBookIds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get loanedTo => $composableBuilder(
    column: $table.loanedTo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loanDate => $composableBuilder(
    column: $table.loanDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateRead => $composableBuilder(
    column: $table.dateRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get readingStatus => $composableBuilder(
    column: $table.readingStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $BooksTable> {
  $$BooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get isbn =>
      $composableBuilder(column: $table.isbn, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get authors =>
      $composableBuilder(column: $table.authors, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<String> get publishedDate => $composableBuilder(
    column: $table.publishedDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bookDescription => $composableBuilder(
    column: $table.bookDescription,
    builder: (column) => column,
  );

  GeneratedColumn<Uint8List> get coverImageData => $composableBuilder(
    column: $table.coverImageData,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<String> get categories => $composableBuilder(
    column: $table.categories,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<String> get deweyDecimalNumber => $composableBuilder(
    column: $table.deweyDecimalNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bisacCategory => $composableBuilder(
    column: $table.bisacCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bisacSubcategory => $composableBuilder(
    column: $table.bisacSubcategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shelfId =>
      $composableBuilder(column: $table.shelfId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get relatedBookIds => $composableBuilder(
    column: $table.relatedBookIds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get loanedTo =>
      $composableBuilder(column: $table.loanedTo, builder: (column) => column);

  GeneratedColumn<DateTime> get loanDate =>
      $composableBuilder(column: $table.loanDate, builder: (column) => column);

  GeneratedColumn<int> get userRating => $composableBuilder(
    column: $table.userRating,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dateRead =>
      $composableBuilder(column: $table.dateRead, builder: (column) => column);

  GeneratedColumn<String> get readingStatus => $composableBuilder(
    column: $table.readingStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$BooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BooksTable,
          BookEntity,
          $$BooksTableFilterComposer,
          $$BooksTableOrderingComposer,
          $$BooksTableAnnotationComposer,
          $$BooksTableCreateCompanionBuilder,
          $$BooksTableUpdateCompanionBuilder,
          (BookEntity, BaseReferences<_$AppDatabase, $BooksTable, BookEntity>),
          BookEntity,
          PrefetchHooks Function()
        > {
  $$BooksTableTableManager(_$AppDatabase db, $BooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> isbn = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> subtitle = const Value.absent(),
                Value<String> authors = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String?> bookDescription = const Value.absent(),
                Value<Uint8List?> coverImageData = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<String> categories = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<DateTime> dateAdded = const Value.absent(),
                Value<String?> deweyDecimalNumber = const Value.absent(),
                Value<String?> bisacCategory = const Value.absent(),
                Value<String?> bisacSubcategory = const Value.absent(),
                Value<String?> shelfId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> relatedBookIds = const Value.absent(),
                Value<String?> loanedTo = const Value.absent(),
                Value<DateTime?> loanDate = const Value.absent(),
                Value<int?> userRating = const Value.absent(),
                Value<DateTime?> dateRead = const Value.absent(),
                Value<String?> readingStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion(
                id: id,
                isbn: isbn,
                title: title,
                subtitle: subtitle,
                authors: authors,
                publisher: publisher,
                publishedDate: publishedDate,
                bookDescription: bookDescription,
                coverImageData: coverImageData,
                coverImageUrl: coverImageUrl,
                pageCount: pageCount,
                categories: categories,
                language: language,
                dateAdded: dateAdded,
                deweyDecimalNumber: deweyDecimalNumber,
                bisacCategory: bisacCategory,
                bisacSubcategory: bisacSubcategory,
                shelfId: shelfId,
                notes: notes,
                tags: tags,
                relatedBookIds: relatedBookIds,
                loanedTo: loanedTo,
                loanDate: loanDate,
                userRating: userRating,
                dateRead: dateRead,
                readingStatus: readingStatus,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String isbn,
                required String title,
                Value<String?> subtitle = const Value.absent(),
                Value<String> authors = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> publishedDate = const Value.absent(),
                Value<String?> bookDescription = const Value.absent(),
                Value<Uint8List?> coverImageData = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<String> categories = const Value.absent(),
                Value<String?> language = const Value.absent(),
                required DateTime dateAdded,
                Value<String?> deweyDecimalNumber = const Value.absent(),
                Value<String?> bisacCategory = const Value.absent(),
                Value<String?> bisacSubcategory = const Value.absent(),
                Value<String?> shelfId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String> relatedBookIds = const Value.absent(),
                Value<String?> loanedTo = const Value.absent(),
                Value<DateTime?> loanDate = const Value.absent(),
                Value<int?> userRating = const Value.absent(),
                Value<DateTime?> dateRead = const Value.absent(),
                Value<String?> readingStatus = const Value.absent(),
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BooksCompanion.insert(
                id: id,
                isbn: isbn,
                title: title,
                subtitle: subtitle,
                authors: authors,
                publisher: publisher,
                publishedDate: publishedDate,
                bookDescription: bookDescription,
                coverImageData: coverImageData,
                coverImageUrl: coverImageUrl,
                pageCount: pageCount,
                categories: categories,
                language: language,
                dateAdded: dateAdded,
                deweyDecimalNumber: deweyDecimalNumber,
                bisacCategory: bisacCategory,
                bisacSubcategory: bisacSubcategory,
                shelfId: shelfId,
                notes: notes,
                tags: tags,
                relatedBookIds: relatedBookIds,
                loanedTo: loanedTo,
                loanDate: loanDate,
                userRating: userRating,
                dateRead: dateRead,
                readingStatus: readingStatus,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BooksTable,
      BookEntity,
      $$BooksTableFilterComposer,
      $$BooksTableOrderingComposer,
      $$BooksTableAnnotationComposer,
      $$BooksTableCreateCompanionBuilder,
      $$BooksTableUpdateCompanionBuilder,
      (BookEntity, BaseReferences<_$AppDatabase, $BooksTable, BookEntity>),
      BookEntity,
      PrefetchHooks Function()
    >;
typedef $$ShelvesTableCreateCompanionBuilder =
    ShelvesCompanion Function({
      required String id,
      required String name,
      Value<String?> roomId,
      required DateTime dateCreated,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ShelvesTableUpdateCompanionBuilder =
    ShelvesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> roomId,
      Value<DateTime> dateCreated,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$ShelvesTableFilterComposer
    extends Composer<_$AppDatabase, $ShelvesTable> {
  $$ShelvesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShelvesTableOrderingComposer
    extends Composer<_$AppDatabase, $ShelvesTable> {
  $$ShelvesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShelvesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShelvesTable> {
  $$ShelvesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$ShelvesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShelvesTable,
          ShelfEntity,
          $$ShelvesTableFilterComposer,
          $$ShelvesTableOrderingComposer,
          $$ShelvesTableAnnotationComposer,
          $$ShelvesTableCreateCompanionBuilder,
          $$ShelvesTableUpdateCompanionBuilder,
          (
            ShelfEntity,
            BaseReferences<_$AppDatabase, $ShelvesTable, ShelfEntity>,
          ),
          ShelfEntity,
          PrefetchHooks Function()
        > {
  $$ShelvesTableTableManager(_$AppDatabase db, $ShelvesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShelvesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShelvesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShelvesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> roomId = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShelvesCompanion(
                id: id,
                name: name,
                roomId: roomId,
                dateCreated: dateCreated,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> roomId = const Value.absent(),
                required DateTime dateCreated,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShelvesCompanion.insert(
                id: id,
                name: name,
                roomId: roomId,
                dateCreated: dateCreated,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShelvesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShelvesTable,
      ShelfEntity,
      $$ShelvesTableFilterComposer,
      $$ShelvesTableOrderingComposer,
      $$ShelvesTableAnnotationComposer,
      $$ShelvesTableCreateCompanionBuilder,
      $$ShelvesTableUpdateCompanionBuilder,
      (ShelfEntity, BaseReferences<_$AppDatabase, $ShelvesTable, ShelfEntity>),
      ShelfEntity,
      PrefetchHooks Function()
    >;
typedef $$RoomsTableCreateCompanionBuilder =
    RoomsCompanion Function({
      required String id,
      required String name,
      required DateTime dateCreated,
      required DateTime updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$RoomsTableUpdateCompanionBuilder =
    RoomsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> dateCreated,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<int> rowid,
    });

class $$RoomsTableFilterComposer extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$RoomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomsTable,
          RoomEntity,
          $$RoomsTableFilterComposer,
          $$RoomsTableOrderingComposer,
          $$RoomsTableAnnotationComposer,
          $$RoomsTableCreateCompanionBuilder,
          $$RoomsTableUpdateCompanionBuilder,
          (RoomEntity, BaseReferences<_$AppDatabase, $RoomsTable, RoomEntity>),
          RoomEntity,
          PrefetchHooks Function()
        > {
  $$RoomsTableTableManager(_$AppDatabase db, $RoomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomsCompanion(
                id: id,
                name: name,
                dateCreated: dateCreated,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required DateTime dateCreated,
                required DateTime updatedAt,
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoomsCompanion.insert(
                id: id,
                name: name,
                dateCreated: dateCreated,
                updatedAt: updatedAt,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomsTable,
      RoomEntity,
      $$RoomsTableFilterComposer,
      $$RoomsTableOrderingComposer,
      $$RoomsTableAnnotationComposer,
      $$RoomsTableCreateCompanionBuilder,
      $$RoomsTableUpdateCompanionBuilder,
      (RoomEntity, BaseReferences<_$AppDatabase, $RoomsTable, RoomEntity>),
      RoomEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BooksTableTableManager get books =>
      $$BooksTableTableManager(_db, _db.books);
  $$ShelvesTableTableManager get shelves =>
      $$ShelvesTableTableManager(_db, _db.shelves);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
}
