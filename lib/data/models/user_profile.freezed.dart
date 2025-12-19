// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

/// User's unique ID (from Firebase Auth).
 String get uid;/// User's email address.
 String get email;/// Display name (optional).
 String? get displayName;/// URL to profile photo.
 String? get photoUrl;/// When the account was created.
 DateTime get createdAt;/// Whether Dewey Decimal numbers should be displayed.
 bool get showDeweyDecimal;/// Default sort order for library.
 SortOrder get defaultSortOrder;/// Theme preference.
 ThemePreference get themePreference;/// Whether to contribute anonymous data to community stats.
 bool get contributeToCommunity;/// Admin override for premium status (1 = premium granted).
 int get overridePremium;/// Last time profile was synced.
 DateTime? get lastSyncedAt;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.showDeweyDecimal, showDeweyDecimal) || other.showDeweyDecimal == showDeweyDecimal)&&(identical(other.defaultSortOrder, defaultSortOrder) || other.defaultSortOrder == defaultSortOrder)&&(identical(other.themePreference, themePreference) || other.themePreference == themePreference)&&(identical(other.contributeToCommunity, contributeToCommunity) || other.contributeToCommunity == contributeToCommunity)&&(identical(other.overridePremium, overridePremium) || other.overridePremium == overridePremium)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,photoUrl,createdAt,showDeweyDecimal,defaultSortOrder,themePreference,contributeToCommunity,overridePremium,lastSyncedAt);

@override
String toString() {
  return 'UserProfile(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, showDeweyDecimal: $showDeweyDecimal, defaultSortOrder: $defaultSortOrder, themePreference: $themePreference, contributeToCommunity: $contributeToCommunity, overridePremium: $overridePremium, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl, DateTime createdAt, bool showDeweyDecimal, SortOrder defaultSortOrder, ThemePreference themePreference, bool contributeToCommunity, int overridePremium, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? showDeweyDecimal = null,Object? defaultSortOrder = null,Object? themePreference = null,Object? contributeToCommunity = null,Object? overridePremium = null,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,showDeweyDecimal: null == showDeweyDecimal ? _self.showDeweyDecimal : showDeweyDecimal // ignore: cast_nullable_to_non_nullable
as bool,defaultSortOrder: null == defaultSortOrder ? _self.defaultSortOrder : defaultSortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,themePreference: null == themePreference ? _self.themePreference : themePreference // ignore: cast_nullable_to_non_nullable
as ThemePreference,contributeToCommunity: null == contributeToCommunity ? _self.contributeToCommunity : contributeToCommunity // ignore: cast_nullable_to_non_nullable
as bool,overridePremium: null == overridePremium ? _self.overridePremium : overridePremium // ignore: cast_nullable_to_non_nullable
as int,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  String? displayName,  String? photoUrl,  DateTime createdAt,  bool showDeweyDecimal,  SortOrder defaultSortOrder,  ThemePreference themePreference,  bool contributeToCommunity,  int overridePremium,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.showDeweyDecimal,_that.defaultSortOrder,_that.themePreference,_that.contributeToCommunity,_that.overridePremium,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  String? displayName,  String? photoUrl,  DateTime createdAt,  bool showDeweyDecimal,  SortOrder defaultSortOrder,  ThemePreference themePreference,  bool contributeToCommunity,  int overridePremium,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.showDeweyDecimal,_that.defaultSortOrder,_that.themePreference,_that.contributeToCommunity,_that.overridePremium,_that.lastSyncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  String? displayName,  String? photoUrl,  DateTime createdAt,  bool showDeweyDecimal,  SortOrder defaultSortOrder,  ThemePreference themePreference,  bool contributeToCommunity,  int overridePremium,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.uid,_that.email,_that.displayName,_that.photoUrl,_that.createdAt,_that.showDeweyDecimal,_that.defaultSortOrder,_that.themePreference,_that.contributeToCommunity,_that.overridePremium,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile extends UserProfile {
  const _UserProfile({required this.uid, required this.email, this.displayName, this.photoUrl, required this.createdAt, this.showDeweyDecimal = false, this.defaultSortOrder = SortOrder.dateAdded, this.themePreference = ThemePreference.system, this.contributeToCommunity = true, this.overridePremium = 0, this.lastSyncedAt}): super._();
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

/// User's unique ID (from Firebase Auth).
@override final  String uid;
/// User's email address.
@override final  String email;
/// Display name (optional).
@override final  String? displayName;
/// URL to profile photo.
@override final  String? photoUrl;
/// When the account was created.
@override final  DateTime createdAt;
/// Whether Dewey Decimal numbers should be displayed.
@override@JsonKey() final  bool showDeweyDecimal;
/// Default sort order for library.
@override@JsonKey() final  SortOrder defaultSortOrder;
/// Theme preference.
@override@JsonKey() final  ThemePreference themePreference;
/// Whether to contribute anonymous data to community stats.
@override@JsonKey() final  bool contributeToCommunity;
/// Admin override for premium status (1 = premium granted).
@override@JsonKey() final  int overridePremium;
/// Last time profile was synced.
@override final  DateTime? lastSyncedAt;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.showDeweyDecimal, showDeweyDecimal) || other.showDeweyDecimal == showDeweyDecimal)&&(identical(other.defaultSortOrder, defaultSortOrder) || other.defaultSortOrder == defaultSortOrder)&&(identical(other.themePreference, themePreference) || other.themePreference == themePreference)&&(identical(other.contributeToCommunity, contributeToCommunity) || other.contributeToCommunity == contributeToCommunity)&&(identical(other.overridePremium, overridePremium) || other.overridePremium == overridePremium)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,photoUrl,createdAt,showDeweyDecimal,defaultSortOrder,themePreference,contributeToCommunity,overridePremium,lastSyncedAt);

@override
String toString() {
  return 'UserProfile(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, showDeweyDecimal: $showDeweyDecimal, defaultSortOrder: $defaultSortOrder, themePreference: $themePreference, contributeToCommunity: $contributeToCommunity, overridePremium: $overridePremium, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl, DateTime createdAt, bool showDeweyDecimal, SortOrder defaultSortOrder, ThemePreference themePreference, bool contributeToCommunity, int overridePremium, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? showDeweyDecimal = null,Object? defaultSortOrder = null,Object? themePreference = null,Object? contributeToCommunity = null,Object? overridePremium = null,Object? lastSyncedAt = freezed,}) {
  return _then(_UserProfile(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,showDeweyDecimal: null == showDeweyDecimal ? _self.showDeweyDecimal : showDeweyDecimal // ignore: cast_nullable_to_non_nullable
as bool,defaultSortOrder: null == defaultSortOrder ? _self.defaultSortOrder : defaultSortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,themePreference: null == themePreference ? _self.themePreference : themePreference // ignore: cast_nullable_to_non_nullable
as ThemePreference,contributeToCommunity: null == contributeToCommunity ? _self.contributeToCommunity : contributeToCommunity // ignore: cast_nullable_to_non_nullable
as bool,overridePremium: null == overridePremium ? _self.overridePremium : overridePremium // ignore: cast_nullable_to_non_nullable
as int,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
