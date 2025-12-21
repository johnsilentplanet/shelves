// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelves_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShelfWithBookCount {

 Shelf get shelf; int get bookCount;
/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfWithBookCountCopyWith<ShelfWithBookCount> get copyWith => _$ShelfWithBookCountCopyWithImpl<ShelfWithBookCount>(this as ShelfWithBookCount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelfWithBookCount&&(identical(other.shelf, shelf) || other.shelf == shelf)&&(identical(other.bookCount, bookCount) || other.bookCount == bookCount));
}


@override
int get hashCode => Object.hash(runtimeType,shelf,bookCount);

@override
String toString() {
  return 'ShelfWithBookCount(shelf: $shelf, bookCount: $bookCount)';
}


}

/// @nodoc
abstract mixin class $ShelfWithBookCountCopyWith<$Res>  {
  factory $ShelfWithBookCountCopyWith(ShelfWithBookCount value, $Res Function(ShelfWithBookCount) _then) = _$ShelfWithBookCountCopyWithImpl;
@useResult
$Res call({
 Shelf shelf, int bookCount
});


$ShelfCopyWith<$Res> get shelf;

}
/// @nodoc
class _$ShelfWithBookCountCopyWithImpl<$Res>
    implements $ShelfWithBookCountCopyWith<$Res> {
  _$ShelfWithBookCountCopyWithImpl(this._self, this._then);

  final ShelfWithBookCount _self;
  final $Res Function(ShelfWithBookCount) _then;

/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shelf = null,Object? bookCount = null,}) {
  return _then(_self.copyWith(
shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShelfCopyWith<$Res> get shelf {
  
  return $ShelfCopyWith<$Res>(_self.shelf, (value) {
    return _then(_self.copyWith(shelf: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShelfWithBookCount].
extension ShelfWithBookCountPatterns on ShelfWithBookCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelfWithBookCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelfWithBookCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelfWithBookCount value)  $default,){
final _that = this;
switch (_that) {
case _ShelfWithBookCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelfWithBookCount value)?  $default,){
final _that = this;
switch (_that) {
case _ShelfWithBookCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Shelf shelf,  int bookCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelfWithBookCount() when $default != null:
return $default(_that.shelf,_that.bookCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Shelf shelf,  int bookCount)  $default,) {final _that = this;
switch (_that) {
case _ShelfWithBookCount():
return $default(_that.shelf,_that.bookCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Shelf shelf,  int bookCount)?  $default,) {final _that = this;
switch (_that) {
case _ShelfWithBookCount() when $default != null:
return $default(_that.shelf,_that.bookCount);case _:
  return null;

}
}

}

/// @nodoc


class _ShelfWithBookCount implements ShelfWithBookCount {
  const _ShelfWithBookCount({required this.shelf, required this.bookCount});
  

@override final  Shelf shelf;
@override final  int bookCount;

/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfWithBookCountCopyWith<_ShelfWithBookCount> get copyWith => __$ShelfWithBookCountCopyWithImpl<_ShelfWithBookCount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelfWithBookCount&&(identical(other.shelf, shelf) || other.shelf == shelf)&&(identical(other.bookCount, bookCount) || other.bookCount == bookCount));
}


@override
int get hashCode => Object.hash(runtimeType,shelf,bookCount);

@override
String toString() {
  return 'ShelfWithBookCount(shelf: $shelf, bookCount: $bookCount)';
}


}

/// @nodoc
abstract mixin class _$ShelfWithBookCountCopyWith<$Res> implements $ShelfWithBookCountCopyWith<$Res> {
  factory _$ShelfWithBookCountCopyWith(_ShelfWithBookCount value, $Res Function(_ShelfWithBookCount) _then) = __$ShelfWithBookCountCopyWithImpl;
@override @useResult
$Res call({
 Shelf shelf, int bookCount
});


@override $ShelfCopyWith<$Res> get shelf;

}
/// @nodoc
class __$ShelfWithBookCountCopyWithImpl<$Res>
    implements _$ShelfWithBookCountCopyWith<$Res> {
  __$ShelfWithBookCountCopyWithImpl(this._self, this._then);

  final _ShelfWithBookCount _self;
  final $Res Function(_ShelfWithBookCount) _then;

/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shelf = null,Object? bookCount = null,}) {
  return _then(_ShelfWithBookCount(
shelf: null == shelf ? _self.shelf : shelf // ignore: cast_nullable_to_non_nullable
as Shelf,bookCount: null == bookCount ? _self.bookCount : bookCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ShelfWithBookCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShelfCopyWith<$Res> get shelf {
  
  return $ShelfCopyWith<$Res>(_self.shelf, (value) {
    return _then(_self.copyWith(shelf: value));
  });
}
}

// dart format on
