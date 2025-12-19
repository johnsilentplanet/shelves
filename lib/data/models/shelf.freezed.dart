// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shelf {

/// Unique identifier for the shelf.
 String get id;/// Display name of the shelf.
 String get name;/// Optional room ID this shelf belongs to.
 String? get roomId;/// When the shelf was created.
 DateTime get dateCreated;/// Last time this shelf was updated.
 DateTime get updatedAt;/// Whether this shelf has been synced to the cloud.
 bool get isSynced;
/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelfCopyWith<Shelf> get copyWith => _$ShelfCopyWithImpl<Shelf>(this as Shelf, _$identity);

  /// Serializes this Shelf to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shelf&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,roomId,dateCreated,updatedAt,isSynced);

@override
String toString() {
  return 'Shelf(id: $id, name: $name, roomId: $roomId, dateCreated: $dateCreated, updatedAt: $updatedAt, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $ShelfCopyWith<$Res>  {
  factory $ShelfCopyWith(Shelf value, $Res Function(Shelf) _then) = _$ShelfCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? roomId, DateTime dateCreated, DateTime updatedAt, bool isSynced
});




}
/// @nodoc
class _$ShelfCopyWithImpl<$Res>
    implements $ShelfCopyWith<$Res> {
  _$ShelfCopyWithImpl(this._self, this._then);

  final Shelf _self;
  final $Res Function(Shelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? roomId = freezed,Object? dateCreated = null,Object? updatedAt = null,Object? isSynced = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Shelf].
extension ShelfPatterns on Shelf {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shelf value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shelf() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shelf value)  $default,){
final _that = this;
switch (_that) {
case _Shelf():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shelf value)?  $default,){
final _that = this;
switch (_that) {
case _Shelf() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? roomId,  DateTime dateCreated,  DateTime updatedAt,  bool isSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shelf() when $default != null:
return $default(_that.id,_that.name,_that.roomId,_that.dateCreated,_that.updatedAt,_that.isSynced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? roomId,  DateTime dateCreated,  DateTime updatedAt,  bool isSynced)  $default,) {final _that = this;
switch (_that) {
case _Shelf():
return $default(_that.id,_that.name,_that.roomId,_that.dateCreated,_that.updatedAt,_that.isSynced);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? roomId,  DateTime dateCreated,  DateTime updatedAt,  bool isSynced)?  $default,) {final _that = this;
switch (_that) {
case _Shelf() when $default != null:
return $default(_that.id,_that.name,_that.roomId,_that.dateCreated,_that.updatedAt,_that.isSynced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shelf extends Shelf {
  const _Shelf({required this.id, required this.name, this.roomId, required this.dateCreated, required this.updatedAt, this.isSynced = false}): super._();
  factory _Shelf.fromJson(Map<String, dynamic> json) => _$ShelfFromJson(json);

/// Unique identifier for the shelf.
@override final  String id;
/// Display name of the shelf.
@override final  String name;
/// Optional room ID this shelf belongs to.
@override final  String? roomId;
/// When the shelf was created.
@override final  DateTime dateCreated;
/// Last time this shelf was updated.
@override final  DateTime updatedAt;
/// Whether this shelf has been synced to the cloud.
@override@JsonKey() final  bool isSynced;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelfCopyWith<_Shelf> get copyWith => __$ShelfCopyWithImpl<_Shelf>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShelfToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shelf&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,roomId,dateCreated,updatedAt,isSynced);

@override
String toString() {
  return 'Shelf(id: $id, name: $name, roomId: $roomId, dateCreated: $dateCreated, updatedAt: $updatedAt, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$ShelfCopyWith<$Res> implements $ShelfCopyWith<$Res> {
  factory _$ShelfCopyWith(_Shelf value, $Res Function(_Shelf) _then) = __$ShelfCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? roomId, DateTime dateCreated, DateTime updatedAt, bool isSynced
});




}
/// @nodoc
class __$ShelfCopyWithImpl<$Res>
    implements _$ShelfCopyWith<$Res> {
  __$ShelfCopyWithImpl(this._self, this._then);

  final _Shelf _self;
  final $Res Function(_Shelf) _then;

/// Create a copy of Shelf
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? roomId = freezed,Object? dateCreated = null,Object? updatedAt = null,Object? isSynced = null,}) {
  return _then(_Shelf(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
