import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// User profile and preferences.
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    /// User's unique ID (from Firebase Auth).
    required String uid,

    /// User's email address.
    required String email,

    /// Display name (optional).
    String? displayName,

    /// URL to profile photo.
    String? photoUrl,

    /// When the account was created.
    required DateTime createdAt,

    /// Whether Dewey Decimal numbers should be displayed.
    @Default(false) bool showDeweyDecimal,

    /// Default sort order for library.
    @Default(SortOrder.dateAdded) SortOrder defaultSortOrder,

    /// Theme preference.
    @Default(ThemePreference.system) ThemePreference themePreference,

    /// Whether to contribute anonymous data to community stats.
    @Default(true) bool contributeToCommunity,

    /// Admin override for premium status (1 = premium granted).
    @Default(0) int overridePremium,

    /// Last time profile was synced.
    DateTime? lastSyncedAt,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// Returns true if user has premium access (via subscription or override).
  bool get hasPremiumOverride => overridePremium == 1;
}

/// Sort order options for the library.
enum SortOrder {
  /// Sort by title alphabetically.
  title,

  /// Sort by author's last name.
  author,

  /// Sort by date added (newest first).
  dateAdded,

  /// Sort by user rating (highest first).
  rating,

  /// Sort by Dewey Decimal number.
  dewey,

  /// Sort by category/BISAC.
  category,
}

/// Theme preference options.
enum ThemePreference {
  /// Follow system theme.
  system,

  /// Always use light theme.
  light,

  /// Always use dark theme.
  dark,
}
