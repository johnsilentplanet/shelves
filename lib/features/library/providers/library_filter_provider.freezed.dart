// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_filter_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryFilter {

 String? get searchQuery; String? get shelfId; ReadingStatus? get readingStatus; List<String> get tags; SortOption get sortBy; bool get sortAscending;
/// Create a copy of LibraryFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryFilterCopyWith<LibraryFilter> get copyWith => _$LibraryFilterCopyWithImpl<LibraryFilter>(this as LibraryFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryFilter&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.shelfId, shelfId) || other.shelfId == shelfId)&&(identical(other.readingStatus, readingStatus) || other.readingStatus == readingStatus)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortAscending, sortAscending) || other.sortAscending == sortAscending));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,shelfId,readingStatus,const DeepCollectionEquality().hash(tags),sortBy,sortAscending);

@override
String toString() {
  return 'LibraryFilter(searchQuery: $searchQuery, shelfId: $shelfId, readingStatus: $readingStatus, tags: $tags, sortBy: $sortBy, sortAscending: $sortAscending)';
}


}

/// @nodoc
abstract mixin class $LibraryFilterCopyWith<$Res>  {
  factory $LibraryFilterCopyWith(LibraryFilter value, $Res Function(LibraryFilter) _then) = _$LibraryFilterCopyWithImpl;
@useResult
$Res call({
 String? searchQuery, String? shelfId, ReadingStatus? readingStatus, List<String> tags, SortOption sortBy, bool sortAscending
});




}
/// @nodoc
class _$LibraryFilterCopyWithImpl<$Res>
    implements $LibraryFilterCopyWith<$Res> {
  _$LibraryFilterCopyWithImpl(this._self, this._then);

  final LibraryFilter _self;
  final $Res Function(LibraryFilter) _then;

/// Create a copy of LibraryFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = freezed,Object? shelfId = freezed,Object? readingStatus = freezed,Object? tags = null,Object? sortBy = null,Object? sortAscending = null,}) {
  return _then(_self.copyWith(
searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,shelfId: freezed == shelfId ? _self.shelfId : shelfId // ignore: cast_nullable_to_non_nullable
as String?,readingStatus: freezed == readingStatus ? _self.readingStatus : readingStatus // ignore: cast_nullable_to_non_nullable
as ReadingStatus?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortOption,sortAscending: null == sortAscending ? _self.sortAscending : sortAscending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryFilter].
extension LibraryFilterPatterns on LibraryFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryFilter value)  $default,){
final _that = this;
switch (_that) {
case _LibraryFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryFilter value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? searchQuery,  String? shelfId,  ReadingStatus? readingStatus,  List<String> tags,  SortOption sortBy,  bool sortAscending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryFilter() when $default != null:
return $default(_that.searchQuery,_that.shelfId,_that.readingStatus,_that.tags,_that.sortBy,_that.sortAscending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? searchQuery,  String? shelfId,  ReadingStatus? readingStatus,  List<String> tags,  SortOption sortBy,  bool sortAscending)  $default,) {final _that = this;
switch (_that) {
case _LibraryFilter():
return $default(_that.searchQuery,_that.shelfId,_that.readingStatus,_that.tags,_that.sortBy,_that.sortAscending);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? searchQuery,  String? shelfId,  ReadingStatus? readingStatus,  List<String> tags,  SortOption sortBy,  bool sortAscending)?  $default,) {final _that = this;
switch (_that) {
case _LibraryFilter() when $default != null:
return $default(_that.searchQuery,_that.shelfId,_that.readingStatus,_that.tags,_that.sortBy,_that.sortAscending);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryFilter implements LibraryFilter {
  const _LibraryFilter({this.searchQuery, this.shelfId, this.readingStatus, final  List<String> tags = const [], this.sortBy = SortOption.dateAdded, this.sortAscending = false}): _tags = tags;
  

@override final  String? searchQuery;
@override final  String? shelfId;
@override final  ReadingStatus? readingStatus;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  SortOption sortBy;
@override@JsonKey() final  bool sortAscending;

/// Create a copy of LibraryFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryFilterCopyWith<_LibraryFilter> get copyWith => __$LibraryFilterCopyWithImpl<_LibraryFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryFilter&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.shelfId, shelfId) || other.shelfId == shelfId)&&(identical(other.readingStatus, readingStatus) || other.readingStatus == readingStatus)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortAscending, sortAscending) || other.sortAscending == sortAscending));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,shelfId,readingStatus,const DeepCollectionEquality().hash(_tags),sortBy,sortAscending);

@override
String toString() {
  return 'LibraryFilter(searchQuery: $searchQuery, shelfId: $shelfId, readingStatus: $readingStatus, tags: $tags, sortBy: $sortBy, sortAscending: $sortAscending)';
}


}

/// @nodoc
abstract mixin class _$LibraryFilterCopyWith<$Res> implements $LibraryFilterCopyWith<$Res> {
  factory _$LibraryFilterCopyWith(_LibraryFilter value, $Res Function(_LibraryFilter) _then) = __$LibraryFilterCopyWithImpl;
@override @useResult
$Res call({
 String? searchQuery, String? shelfId, ReadingStatus? readingStatus, List<String> tags, SortOption sortBy, bool sortAscending
});




}
/// @nodoc
class __$LibraryFilterCopyWithImpl<$Res>
    implements _$LibraryFilterCopyWith<$Res> {
  __$LibraryFilterCopyWithImpl(this._self, this._then);

  final _LibraryFilter _self;
  final $Res Function(_LibraryFilter) _then;

/// Create a copy of LibraryFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = freezed,Object? shelfId = freezed,Object? readingStatus = freezed,Object? tags = null,Object? sortBy = null,Object? sortAscending = null,}) {
  return _then(_LibraryFilter(
searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,shelfId: freezed == shelfId ? _self.shelfId : shelfId // ignore: cast_nullable_to_non_nullable
as String?,readingStatus: freezed == readingStatus ? _self.readingStatus : readingStatus // ignore: cast_nullable_to_non_nullable
as ReadingStatus?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortOption,sortAscending: null == sortAscending ? _self.sortAscending : sortAscending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
