// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  showDeweyDecimal: json['showDeweyDecimal'] as bool? ?? false,
  defaultSortOrder:
      $enumDecodeNullable(_$SortOrderEnumMap, json['defaultSortOrder']) ??
      SortOrder.dateAdded,
  themePreference:
      $enumDecodeNullable(_$ThemePreferenceEnumMap, json['themePreference']) ??
      ThemePreference.system,
  contributeToCommunity: json['contributeToCommunity'] as bool? ?? true,
  overridePremium: (json['overridePremium'] as num?)?.toInt() ?? 0,
  lastSyncedAt: json['lastSyncedAt'] == null
      ? null
      : DateTime.parse(json['lastSyncedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'showDeweyDecimal': instance.showDeweyDecimal,
      'defaultSortOrder': _$SortOrderEnumMap[instance.defaultSortOrder]!,
      'themePreference': _$ThemePreferenceEnumMap[instance.themePreference]!,
      'contributeToCommunity': instance.contributeToCommunity,
      'overridePremium': instance.overridePremium,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$SortOrderEnumMap = {
  SortOrder.title: 'title',
  SortOrder.author: 'author',
  SortOrder.dateAdded: 'dateAdded',
  SortOrder.rating: 'rating',
  SortOrder.dewey: 'dewey',
  SortOrder.category: 'category',
};

const _$ThemePreferenceEnumMap = {
  ThemePreference.system: 'system',
  ThemePreference.light: 'light',
  ThemePreference.dark: 'dark',
};
