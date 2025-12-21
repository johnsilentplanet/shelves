// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rooms_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomWithShelfCount {

 Room get room; int get shelfCount;
/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomWithShelfCountCopyWith<RoomWithShelfCount> get copyWith => _$RoomWithShelfCountCopyWithImpl<RoomWithShelfCount>(this as RoomWithShelfCount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomWithShelfCount&&(identical(other.room, room) || other.room == room)&&(identical(other.shelfCount, shelfCount) || other.shelfCount == shelfCount));
}


@override
int get hashCode => Object.hash(runtimeType,room,shelfCount);

@override
String toString() {
  return 'RoomWithShelfCount(room: $room, shelfCount: $shelfCount)';
}


}

/// @nodoc
abstract mixin class $RoomWithShelfCountCopyWith<$Res>  {
  factory $RoomWithShelfCountCopyWith(RoomWithShelfCount value, $Res Function(RoomWithShelfCount) _then) = _$RoomWithShelfCountCopyWithImpl;
@useResult
$Res call({
 Room room, int shelfCount
});


$RoomCopyWith<$Res> get room;

}
/// @nodoc
class _$RoomWithShelfCountCopyWithImpl<$Res>
    implements $RoomWithShelfCountCopyWith<$Res> {
  _$RoomWithShelfCountCopyWithImpl(this._self, this._then);

  final RoomWithShelfCount _self;
  final $Res Function(RoomWithShelfCount) _then;

/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = null,Object? shelfCount = null,}) {
  return _then(_self.copyWith(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,shelfCount: null == shelfCount ? _self.shelfCount : shelfCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomWithShelfCount].
extension RoomWithShelfCountPatterns on RoomWithShelfCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomWithShelfCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomWithShelfCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomWithShelfCount value)  $default,){
final _that = this;
switch (_that) {
case _RoomWithShelfCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomWithShelfCount value)?  $default,){
final _that = this;
switch (_that) {
case _RoomWithShelfCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Room room,  int shelfCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomWithShelfCount() when $default != null:
return $default(_that.room,_that.shelfCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Room room,  int shelfCount)  $default,) {final _that = this;
switch (_that) {
case _RoomWithShelfCount():
return $default(_that.room,_that.shelfCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Room room,  int shelfCount)?  $default,) {final _that = this;
switch (_that) {
case _RoomWithShelfCount() when $default != null:
return $default(_that.room,_that.shelfCount);case _:
  return null;

}
}

}

/// @nodoc


class _RoomWithShelfCount implements RoomWithShelfCount {
  const _RoomWithShelfCount({required this.room, required this.shelfCount});
  

@override final  Room room;
@override final  int shelfCount;

/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomWithShelfCountCopyWith<_RoomWithShelfCount> get copyWith => __$RoomWithShelfCountCopyWithImpl<_RoomWithShelfCount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomWithShelfCount&&(identical(other.room, room) || other.room == room)&&(identical(other.shelfCount, shelfCount) || other.shelfCount == shelfCount));
}


@override
int get hashCode => Object.hash(runtimeType,room,shelfCount);

@override
String toString() {
  return 'RoomWithShelfCount(room: $room, shelfCount: $shelfCount)';
}


}

/// @nodoc
abstract mixin class _$RoomWithShelfCountCopyWith<$Res> implements $RoomWithShelfCountCopyWith<$Res> {
  factory _$RoomWithShelfCountCopyWith(_RoomWithShelfCount value, $Res Function(_RoomWithShelfCount) _then) = __$RoomWithShelfCountCopyWithImpl;
@override @useResult
$Res call({
 Room room, int shelfCount
});


@override $RoomCopyWith<$Res> get room;

}
/// @nodoc
class __$RoomWithShelfCountCopyWithImpl<$Res>
    implements _$RoomWithShelfCountCopyWith<$Res> {
  __$RoomWithShelfCountCopyWithImpl(this._self, this._then);

  final _RoomWithShelfCount _self;
  final $Res Function(_RoomWithShelfCount) _then;

/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = null,Object? shelfCount = null,}) {
  return _then(_RoomWithShelfCount(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room,shelfCount: null == shelfCount ? _self.shelfCount : shelfCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of RoomWithShelfCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCopyWith<$Res> get room {
  
  return $RoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on
