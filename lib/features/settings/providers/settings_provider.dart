import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../library/providers/library_filter_provider.dart';

part 'settings_provider.freezed.dart';
part 'settings_provider.g.dart';

/// User settings state.
@freezed
sealed class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(false) bool showDeweyDecimal,
    @Default(SortOption.dateAdded) SortOption defaultSortOption,
    @Default(false) bool defaultSortAscending,
    @Default(true) bool communityContributionEnabled,
  }) = _UserSettings;
}

/// Keys for SharedPreferences storage.
abstract class _SettingsKeys {
  static const themeMode = 'settings_theme_mode';
  static const showDeweyDecimal = 'settings_show_dewey';
  static const defaultSortOption = 'settings_default_sort';
  static const defaultSortAscending = 'settings_sort_ascending';
  static const communityContribution = 'settings_community_contribution';
}

/// Provides SharedPreferences instance.
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) =>
    SharedPreferences.getInstance();

/// Notifier for user settings.
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<UserSettings> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    return _loadSettings(prefs);
  }

  UserSettings _loadSettings(SharedPreferences prefs) {
    final themeModeIndex = prefs.getInt(_SettingsKeys.themeMode) ?? 0;
    final sortOptionIndex = prefs.getInt(_SettingsKeys.defaultSortOption) ?? 2;

    return UserSettings(
      themeMode: ThemeMode.values[themeModeIndex],
      showDeweyDecimal: prefs.getBool(_SettingsKeys.showDeweyDecimal) ?? false,
      defaultSortOption: SortOption.values[sortOptionIndex],
      defaultSortAscending:
          prefs.getBool(_SettingsKeys.defaultSortAscending) ?? false,
      communityContributionEnabled:
          prefs.getBool(_SettingsKeys.communityContribution) ?? true,
    );
  }

  /// Sets the theme mode.
  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setInt(_SettingsKeys.themeMode, mode.index);
    state = AsyncData(
      state.requireValue.copyWith(themeMode: mode),
    );
  }

  /// Toggles the Dewey Decimal display setting.
  Future<void> toggleDeweyDecimal() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final current = state.requireValue.showDeweyDecimal;
    await prefs.setBool(_SettingsKeys.showDeweyDecimal, !current);
    state = AsyncData(
      state.requireValue.copyWith(showDeweyDecimal: !current),
    );
  }

  /// Sets whether to show Dewey Decimal numbers.
  Future<void> setShowDeweyDecimal({required bool show}) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setBool(_SettingsKeys.showDeweyDecimal, show);
    state = AsyncData(
      state.requireValue.copyWith(showDeweyDecimal: show),
    );
  }

  /// Sets the default sort option.
  Future<void> setDefaultSortOption(SortOption option) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setInt(_SettingsKeys.defaultSortOption, option.index);
    state = AsyncData(
      state.requireValue.copyWith(defaultSortOption: option),
    );
  }

  /// Sets the default sort direction.
  Future<void> setDefaultSortAscending({required bool ascending}) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setBool(_SettingsKeys.defaultSortAscending, ascending);
    state = AsyncData(
      state.requireValue.copyWith(defaultSortAscending: ascending),
    );
  }

  /// Toggles community contribution setting.
  Future<void> toggleCommunityContribution() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final current = state.requireValue.communityContributionEnabled;
    await prefs.setBool(_SettingsKeys.communityContribution, !current);
    state = AsyncData(
      state.requireValue.copyWith(communityContributionEnabled: !current),
    );
  }

  /// Sets community contribution enabled state.
  Future<void> setCommunityContribution({required bool enabled}) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setBool(_SettingsKeys.communityContribution, enabled);
    state = AsyncData(
      state.requireValue.copyWith(communityContributionEnabled: enabled),
    );
  }

  /// Resets all settings to defaults.
  Future<void> resetToDefaults() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.remove(_SettingsKeys.themeMode);
    await prefs.remove(_SettingsKeys.showDeweyDecimal);
    await prefs.remove(_SettingsKeys.defaultSortOption);
    await prefs.remove(_SettingsKeys.defaultSortAscending);
    await prefs.remove(_SettingsKeys.communityContribution);
    state = const AsyncData(UserSettings());
  }
}

/// Current theme mode from settings.
@riverpod
ThemeMode currentThemeMode(Ref ref) {
  final settings = ref.watch(settingsProvider);
  return settings.value?.themeMode ?? ThemeMode.system;
}

/// Whether to show Dewey Decimal numbers.
@riverpod
bool showDeweyDecimal(Ref ref) {
  final settings = ref.watch(settingsProvider);
  return settings.value?.showDeweyDecimal ?? false;
}
