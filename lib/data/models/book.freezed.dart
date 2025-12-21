// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Book {

/// Unique identifier for the book.
 String get id;/// ISBN (ISBN-10 or ISBN-13).
 String get isbn;/// Book title.
 String get title;/// Optional subtitle.
 String? get subtitle;/// List of authors.
 List<String> get authors;/// Publisher name.
 String? get publisher;/// Publication date as string (may be year only or full date).
 String? get publishedDate;/// Book description/summary.
 String? get description;/// Cover image stored as bytes.
@Uint8ListConverter() Uint8List? get coverImageData;/// Cover image URL from API (not stored locally).
 String? get coverImageUrl;/// Number of pages.
 int? get pageCount;/// Categories/genres from API.
 List<String> get categories;/// Language code (e.g., 'en').
 String? get language;/// When the book was added to the library.
 DateTime get dateAdded;/// Dewey Decimal classification number.
 String? get deweyDecimalNumber;/// BISAC category (AI-generated, premium feature).
 String? get bisacCategory;/// BISAC subcategory (AI-generated, premium feature).
 String? get bisacSubcategory;/// ID of the shelf this book belongs to.
 String? get shelfId;/// User's personal notes about the book.
 String? get notes;/// User-defined tags for organization.
 List<String> get tags;/// IDs of related books (AI-generated, premium feature).
 List<String> get relatedBookIds;/// Name of person who borrowed this book.
 String? get loanedTo;/// Date when the book was loaned out.
 DateTime? get loanDate;/// User's rating (1-5 stars).
 int? get userRating;/// Date when the user finished reading.
 DateTime? get dateRead;/// Current reading status.
@ReadingStatusConverter() ReadingStatus? get readingStatus;/// Last time this book was updated.
 DateTime get updatedAt;/// Whether this book has been synced to the cloud.
 bool get isSynced;
/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookCopyWith<Book> get copyWith => _$BookCopyWithImpl<Book>(this as Book, _$identity);

  /// Serializes this Book to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Book&&(identical(other.id, id) || other.id == id)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.authors, authors)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.coverImageData, coverImageData)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.deweyDecimalNumber, deweyDecimalNumber) || other.deweyDecimalNumber == deweyDecimalNumber)&&(identical(other.bisacCategory, bisacCategory) || other.bisacCategory == bisacCategory)&&(identical(other.bisacSubcategory, bisacSubcategory) || other.bisacSubcategory == bisacSubcategory)&&(identical(other.shelfId, shelfId) || other.shelfId == shelfId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.relatedBookIds, relatedBookIds)&&(identical(other.loanedTo, loanedTo) || other.loanedTo == loanedTo)&&(identical(other.loanDate, loanDate) || other.loanDate == loanDate)&&(identical(other.userRating, userRating) || other.userRating == userRating)&&(identical(other.dateRead, dateRead) || other.dateRead == dateRead)&&(identical(other.readingStatus, readingStatus) || other.readingStatus == readingStatus)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,isbn,title,subtitle,const DeepCollectionEquality().hash(authors),publisher,publishedDate,description,const DeepCollectionEquality().hash(coverImageData),coverImageUrl,pageCount,const DeepCollectionEquality().hash(categories),language,dateAdded,deweyDecimalNumber,bisacCategory,bisacSubcategory,shelfId,notes,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(relatedBookIds),loanedTo,loanDate,userRating,dateRead,readingStatus,updatedAt,isSynced]);

@override
String toString() {
  return 'Book(id: $id, isbn: $isbn, title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, coverImageData: $coverImageData, coverImageUrl: $coverImageUrl, pageCount: $pageCount, categories: $categories, language: $language, dateAdded: $dateAdded, deweyDecimalNumber: $deweyDecimalNumber, bisacCategory: $bisacCategory, bisacSubcategory: $bisacSubcategory, shelfId: $shelfId, notes: $notes, tags: $tags, relatedBookIds: $relatedBookIds, loanedTo: $loanedTo, loanDate: $loanDate, userRating: $userRating, dateRead: $dateRead, readingStatus: $readingStatus, updatedAt: $updatedAt, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $BookCopyWith<$Res>  {
  factory $BookCopyWith(Book value, $Res Function(Book) _then) = _$BookCopyWithImpl;
@useResult
$Res call({
 String id, String isbn, String title, String? subtitle, List<String> authors, String? publisher, String? publishedDate, String? description,@Uint8ListConverter() Uint8List? coverImageData, String? coverImageUrl, int? pageCount, List<String> categories, String? language, DateTime dateAdded, String? deweyDecimalNumber, String? bisacCategory, String? bisacSubcategory, String? shelfId, String? notes, List<String> tags, List<String> relatedBookIds, String? loanedTo, DateTime? loanDate, int? userRating, DateTime? dateRead,@ReadingStatusConverter() ReadingStatus? readingStatus, DateTime updatedAt, bool isSynced
});




}
/// @nodoc
class _$BookCopyWithImpl<$Res>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._self, this._then);

  final Book _self;
  final $Res Function(Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isbn = null,Object? title = null,Object? subtitle = freezed,Object? authors = null,Object? publisher = freezed,Object? publishedDate = freezed,Object? description = freezed,Object? coverImageData = freezed,Object? coverImageUrl = freezed,Object? pageCount = freezed,Object? categories = null,Object? language = freezed,Object? dateAdded = null,Object? deweyDecimalNumber = freezed,Object? bisacCategory = freezed,Object? bisacSubcategory = freezed,Object? shelfId = freezed,Object? notes = freezed,Object? tags = null,Object? relatedBookIds = null,Object? loanedTo = freezed,Object? loanDate = freezed,Object? userRating = freezed,Object? dateRead = freezed,Object? readingStatus = freezed,Object? updatedAt = null,Object? isSynced = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverImageData: freezed == coverImageData ? _self.coverImageData : coverImageData // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,deweyDecimalNumber: freezed == deweyDecimalNumber ? _self.deweyDecimalNumber : deweyDecimalNumber // ignore: cast_nullable_to_non_nullable
as String?,bisacCategory: freezed == bisacCategory ? _self.bisacCategory : bisacCategory // ignore: cast_nullable_to_non_nullable
as String?,bisacSubcategory: freezed == bisacSubcategory ? _self.bisacSubcategory : bisacSubcategory // ignore: cast_nullable_to_non_nullable
as String?,shelfId: freezed == shelfId ? _self.shelfId : shelfId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,relatedBookIds: null == relatedBookIds ? _self.relatedBookIds : relatedBookIds // ignore: cast_nullable_to_non_nullable
as List<String>,loanedTo: freezed == loanedTo ? _self.loanedTo : loanedTo // ignore: cast_nullable_to_non_nullable
as String?,loanDate: freezed == loanDate ? _self.loanDate : loanDate // ignore: cast_nullable_to_non_nullable
as DateTime?,userRating: freezed == userRating ? _self.userRating : userRating // ignore: cast_nullable_to_non_nullable
as int?,dateRead: freezed == dateRead ? _self.dateRead : dateRead // ignore: cast_nullable_to_non_nullable
as DateTime?,readingStatus: freezed == readingStatus ? _self.readingStatus : readingStatus // ignore: cast_nullable_to_non_nullable
as ReadingStatus?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Book].
extension BookPatterns on Book {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Book value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Book value)  $default,){
final _that = this;
switch (_that) {
case _Book():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Book value)?  $default,){
final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String isbn,  String title,  String? subtitle,  List<String> authors,  String? publisher,  String? publishedDate,  String? description, @Uint8ListConverter()  Uint8List? coverImageData,  String? coverImageUrl,  int? pageCount,  List<String> categories,  String? language,  DateTime dateAdded,  String? deweyDecimalNumber,  String? bisacCategory,  String? bisacSubcategory,  String? shelfId,  String? notes,  List<String> tags,  List<String> relatedBookIds,  String? loanedTo,  DateTime? loanDate,  int? userRating,  DateTime? dateRead, @ReadingStatusConverter()  ReadingStatus? readingStatus,  DateTime updatedAt,  bool isSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.isbn,_that.title,_that.subtitle,_that.authors,_that.publisher,_that.publishedDate,_that.description,_that.coverImageData,_that.coverImageUrl,_that.pageCount,_that.categories,_that.language,_that.dateAdded,_that.deweyDecimalNumber,_that.bisacCategory,_that.bisacSubcategory,_that.shelfId,_that.notes,_that.tags,_that.relatedBookIds,_that.loanedTo,_that.loanDate,_that.userRating,_that.dateRead,_that.readingStatus,_that.updatedAt,_that.isSynced);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String isbn,  String title,  String? subtitle,  List<String> authors,  String? publisher,  String? publishedDate,  String? description, @Uint8ListConverter()  Uint8List? coverImageData,  String? coverImageUrl,  int? pageCount,  List<String> categories,  String? language,  DateTime dateAdded,  String? deweyDecimalNumber,  String? bisacCategory,  String? bisacSubcategory,  String? shelfId,  String? notes,  List<String> tags,  List<String> relatedBookIds,  String? loanedTo,  DateTime? loanDate,  int? userRating,  DateTime? dateRead, @ReadingStatusConverter()  ReadingStatus? readingStatus,  DateTime updatedAt,  bool isSynced)  $default,) {final _that = this;
switch (_that) {
case _Book():
return $default(_that.id,_that.isbn,_that.title,_that.subtitle,_that.authors,_that.publisher,_that.publishedDate,_that.description,_that.coverImageData,_that.coverImageUrl,_that.pageCount,_that.categories,_that.language,_that.dateAdded,_that.deweyDecimalNumber,_that.bisacCategory,_that.bisacSubcategory,_that.shelfId,_that.notes,_that.tags,_that.relatedBookIds,_that.loanedTo,_that.loanDate,_that.userRating,_that.dateRead,_that.readingStatus,_that.updatedAt,_that.isSynced);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String isbn,  String title,  String? subtitle,  List<String> authors,  String? publisher,  String? publishedDate,  String? description, @Uint8ListConverter()  Uint8List? coverImageData,  String? coverImageUrl,  int? pageCount,  List<String> categories,  String? language,  DateTime dateAdded,  String? deweyDecimalNumber,  String? bisacCategory,  String? bisacSubcategory,  String? shelfId,  String? notes,  List<String> tags,  List<String> relatedBookIds,  String? loanedTo,  DateTime? loanDate,  int? userRating,  DateTime? dateRead, @ReadingStatusConverter()  ReadingStatus? readingStatus,  DateTime updatedAt,  bool isSynced)?  $default,) {final _that = this;
switch (_that) {
case _Book() when $default != null:
return $default(_that.id,_that.isbn,_that.title,_that.subtitle,_that.authors,_that.publisher,_that.publishedDate,_that.description,_that.coverImageData,_that.coverImageUrl,_that.pageCount,_that.categories,_that.language,_that.dateAdded,_that.deweyDecimalNumber,_that.bisacCategory,_that.bisacSubcategory,_that.shelfId,_that.notes,_that.tags,_that.relatedBookIds,_that.loanedTo,_that.loanDate,_that.userRating,_that.dateRead,_that.readingStatus,_that.updatedAt,_that.isSynced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Book extends Book {
  const _Book({required this.id, required this.isbn, required this.title, this.subtitle, final  List<String> authors = const [], this.publisher, this.publishedDate, this.description, @Uint8ListConverter() this.coverImageData, this.coverImageUrl, this.pageCount, final  List<String> categories = const [], this.language, required this.dateAdded, this.deweyDecimalNumber, this.bisacCategory, this.bisacSubcategory, this.shelfId, this.notes, final  List<String> tags = const [], final  List<String> relatedBookIds = const [], this.loanedTo, this.loanDate, this.userRating, this.dateRead, @ReadingStatusConverter() this.readingStatus, required this.updatedAt, this.isSynced = false}): _authors = authors,_categories = categories,_tags = tags,_relatedBookIds = relatedBookIds,super._();
  factory _Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

/// Unique identifier for the book.
@override final  String id;
/// ISBN (ISBN-10 or ISBN-13).
@override final  String isbn;
/// Book title.
@override final  String title;
/// Optional subtitle.
@override final  String? subtitle;
/// List of authors.
 final  List<String> _authors;
/// List of authors.
@override@JsonKey() List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

/// Publisher name.
@override final  String? publisher;
/// Publication date as string (may be year only or full date).
@override final  String? publishedDate;
/// Book description/summary.
@override final  String? description;
/// Cover image stored as bytes.
@override@Uint8ListConverter() final  Uint8List? coverImageData;
/// Cover image URL from API (not stored locally).
@override final  String? coverImageUrl;
/// Number of pages.
@override final  int? pageCount;
/// Categories/genres from API.
 final  List<String> _categories;
/// Categories/genres from API.
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

/// Language code (e.g., 'en').
@override final  String? language;
/// When the book was added to the library.
@override final  DateTime dateAdded;
/// Dewey Decimal classification number.
@override final  String? deweyDecimalNumber;
/// BISAC category (AI-generated, premium feature).
@override final  String? bisacCategory;
/// BISAC subcategory (AI-generated, premium feature).
@override final  String? bisacSubcategory;
/// ID of the shelf this book belongs to.
@override final  String? shelfId;
/// User's personal notes about the book.
@override final  String? notes;
/// User-defined tags for organization.
 final  List<String> _tags;
/// User-defined tags for organization.
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// IDs of related books (AI-generated, premium feature).
 final  List<String> _relatedBookIds;
/// IDs of related books (AI-generated, premium feature).
@override@JsonKey() List<String> get relatedBookIds {
  if (_relatedBookIds is EqualUnmodifiableListView) return _relatedBookIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedBookIds);
}

/// Name of person who borrowed this book.
@override final  String? loanedTo;
/// Date when the book was loaned out.
@override final  DateTime? loanDate;
/// User's rating (1-5 stars).
@override final  int? userRating;
/// Date when the user finished reading.
@override final  DateTime? dateRead;
/// Current reading status.
@override@ReadingStatusConverter() final  ReadingStatus? readingStatus;
/// Last time this book was updated.
@override final  DateTime updatedAt;
/// Whether this book has been synced to the cloud.
@override@JsonKey() final  bool isSynced;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookCopyWith<_Book> get copyWith => __$BookCopyWithImpl<_Book>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Book&&(identical(other.id, id) || other.id == id)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._authors, _authors)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.coverImageData, coverImageData)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.language, language) || other.language == language)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.deweyDecimalNumber, deweyDecimalNumber) || other.deweyDecimalNumber == deweyDecimalNumber)&&(identical(other.bisacCategory, bisacCategory) || other.bisacCategory == bisacCategory)&&(identical(other.bisacSubcategory, bisacSubcategory) || other.bisacSubcategory == bisacSubcategory)&&(identical(other.shelfId, shelfId) || other.shelfId == shelfId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._relatedBookIds, _relatedBookIds)&&(identical(other.loanedTo, loanedTo) || other.loanedTo == loanedTo)&&(identical(other.loanDate, loanDate) || other.loanDate == loanDate)&&(identical(other.userRating, userRating) || other.userRating == userRating)&&(identical(other.dateRead, dateRead) || other.dateRead == dateRead)&&(identical(other.readingStatus, readingStatus) || other.readingStatus == readingStatus)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,isbn,title,subtitle,const DeepCollectionEquality().hash(_authors),publisher,publishedDate,description,const DeepCollectionEquality().hash(coverImageData),coverImageUrl,pageCount,const DeepCollectionEquality().hash(_categories),language,dateAdded,deweyDecimalNumber,bisacCategory,bisacSubcategory,shelfId,notes,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_relatedBookIds),loanedTo,loanDate,userRating,dateRead,readingStatus,updatedAt,isSynced]);

@override
String toString() {
  return 'Book(id: $id, isbn: $isbn, title: $title, subtitle: $subtitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, coverImageData: $coverImageData, coverImageUrl: $coverImageUrl, pageCount: $pageCount, categories: $categories, language: $language, dateAdded: $dateAdded, deweyDecimalNumber: $deweyDecimalNumber, bisacCategory: $bisacCategory, bisacSubcategory: $bisacSubcategory, shelfId: $shelfId, notes: $notes, tags: $tags, relatedBookIds: $relatedBookIds, loanedTo: $loanedTo, loanDate: $loanDate, userRating: $userRating, dateRead: $dateRead, readingStatus: $readingStatus, updatedAt: $updatedAt, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$BookCopyWith(_Book value, $Res Function(_Book) _then) = __$BookCopyWithImpl;
@override @useResult
$Res call({
 String id, String isbn, String title, String? subtitle, List<String> authors, String? publisher, String? publishedDate, String? description,@Uint8ListConverter() Uint8List? coverImageData, String? coverImageUrl, int? pageCount, List<String> categories, String? language, DateTime dateAdded, String? deweyDecimalNumber, String? bisacCategory, String? bisacSubcategory, String? shelfId, String? notes, List<String> tags, List<String> relatedBookIds, String? loanedTo, DateTime? loanDate, int? userRating, DateTime? dateRead,@ReadingStatusConverter() ReadingStatus? readingStatus, DateTime updatedAt, bool isSynced
});




}
/// @nodoc
class __$BookCopyWithImpl<$Res>
    implements _$BookCopyWith<$Res> {
  __$BookCopyWithImpl(this._self, this._then);

  final _Book _self;
  final $Res Function(_Book) _then;

/// Create a copy of Book
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isbn = null,Object? title = null,Object? subtitle = freezed,Object? authors = null,Object? publisher = freezed,Object? publishedDate = freezed,Object? description = freezed,Object? coverImageData = freezed,Object? coverImageUrl = freezed,Object? pageCount = freezed,Object? categories = null,Object? language = freezed,Object? dateAdded = null,Object? deweyDecimalNumber = freezed,Object? bisacCategory = freezed,Object? bisacSubcategory = freezed,Object? shelfId = freezed,Object? notes = freezed,Object? tags = null,Object? relatedBookIds = null,Object? loanedTo = freezed,Object? loanDate = freezed,Object? userRating = freezed,Object? dateRead = freezed,Object? readingStatus = freezed,Object? updatedAt = null,Object? isSynced = null,}) {
  return _then(_Book(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,coverImageData: freezed == coverImageData ? _self.coverImageData : coverImageData // ignore: cast_nullable_to_non_nullable
as Uint8List?,coverImageUrl: freezed == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,pageCount: freezed == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime,deweyDecimalNumber: freezed == deweyDecimalNumber ? _self.deweyDecimalNumber : deweyDecimalNumber // ignore: cast_nullable_to_non_nullable
as String?,bisacCategory: freezed == bisacCategory ? _self.bisacCategory : bisacCategory // ignore: cast_nullable_to_non_nullable
as String?,bisacSubcategory: freezed == bisacSubcategory ? _self.bisacSubcategory : bisacSubcategory // ignore: cast_nullable_to_non_nullable
as String?,shelfId: freezed == shelfId ? _self.shelfId : shelfId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,relatedBookIds: null == relatedBookIds ? _self._relatedBookIds : relatedBookIds // ignore: cast_nullable_to_non_nullable
as List<String>,loanedTo: freezed == loanedTo ? _self.loanedTo : loanedTo // ignore: cast_nullable_to_non_nullable
as String?,loanDate: freezed == loanDate ? _self.loanDate : loanDate // ignore: cast_nullable_to_non_nullable
as DateTime?,userRating: freezed == userRating ? _self.userRating : userRating // ignore: cast_nullable_to_non_nullable
as int?,dateRead: freezed == dateRead ? _self.dateRead : dateRead // ignore: cast_nullable_to_non_nullable
as DateTime?,readingStatus: freezed == readingStatus ? _self.readingStatus : readingStatus // ignore: cast_nullable_to_non_nullable
as ReadingStatus?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
