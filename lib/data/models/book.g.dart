// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: json['id'] as String,
  isbn: json['isbn'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String?,
  authors:
      (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  publisher: json['publisher'] as String?,
  publishedDate: json['publishedDate'] as String?,
  description: json['description'] as String?,
  coverImageData: const Uint8ListConverter().fromJson(
    json['coverImageData'] as String?,
  ),
  coverImageUrl: json['coverImageUrl'] as String?,
  pageCount: (json['pageCount'] as num?)?.toInt(),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  language: json['language'] as String?,
  dateAdded: DateTime.parse(json['dateAdded'] as String),
  deweyDecimalNumber: json['deweyDecimalNumber'] as String?,
  bisacCategory: json['bisacCategory'] as String?,
  bisacSubcategory: json['bisacSubcategory'] as String?,
  shelfId: json['shelfId'] as String?,
  notes: json['notes'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  relatedBookIds:
      (json['relatedBookIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  loanedTo: json['loanedTo'] as String?,
  loanDate: json['loanDate'] == null
      ? null
      : DateTime.parse(json['loanDate'] as String),
  userRating: (json['userRating'] as num?)?.toInt(),
  dateRead: json['dateRead'] == null
      ? null
      : DateTime.parse(json['dateRead'] as String),
  readingStatus: const ReadingStatusConverter().fromJson(
    json['readingStatus'] as String?,
  ),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'isbn': instance.isbn,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'authors': instance.authors,
  'publisher': instance.publisher,
  'publishedDate': instance.publishedDate,
  'description': instance.description,
  'coverImageData': const Uint8ListConverter().toJson(instance.coverImageData),
  'coverImageUrl': instance.coverImageUrl,
  'pageCount': instance.pageCount,
  'categories': instance.categories,
  'language': instance.language,
  'dateAdded': instance.dateAdded.toIso8601String(),
  'deweyDecimalNumber': instance.deweyDecimalNumber,
  'bisacCategory': instance.bisacCategory,
  'bisacSubcategory': instance.bisacSubcategory,
  'shelfId': instance.shelfId,
  'notes': instance.notes,
  'tags': instance.tags,
  'relatedBookIds': instance.relatedBookIds,
  'loanedTo': instance.loanedTo,
  'loanDate': instance.loanDate?.toIso8601String(),
  'userRating': instance.userRating,
  'dateRead': instance.dateRead?.toIso8601String(),
  'readingStatus': const ReadingStatusConverter().toJson(
    instance.readingStatus,
  ),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};
