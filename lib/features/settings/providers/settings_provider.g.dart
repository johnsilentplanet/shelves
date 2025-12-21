// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides SharedPreferences instance.

@ProviderFor(sharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

/// Provides SharedPreferences instance.

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferences>,
          SharedPreferences,
          FutureOr<SharedPreferences>
        >
    with
        $FutureModifier<SharedPreferences>,
        $FutureProvider<SharedPreferences> {
  /// Provides SharedPreferences instance.
  const SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferences> create(Ref ref) {
    return sharedPreferences(ref);
  }
}

String _$sharedPreferencesHash() => r'ad13470fe866595ad0f58a3e26f11048d94ef22e';

/// Notifier for user settings.

@ProviderFor(SettingsNotifier)
const settingsProvider = SettingsNotifierProvider._();

/// Notifier for user settings.
final class SettingsNotifierProvider
    extends $AsyncNotifierProvider<SettingsNotifier, UserSettings> {
  /// Notifier for user settings.
  const SettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsNotifierHash();

  @$internal
  @override
  SettingsNotifier create() => SettingsNotifier();
}

String _$settingsNotifierHash() => r'9c1e5d8fca2e8977592c3054c6b524d1652057b8';

/// Notifier for user settings.

abstract class _$SettingsNotifier extends $AsyncNotifier<UserSettings> {
  FutureOr<UserSettings> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserSettings>, UserSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserSettings>, UserSettings>,
              AsyncValue<UserSettings>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Current theme mode from settings.

@ProviderFor(currentThemeMode)
const currentThemeModeProvider = CurrentThemeModeProvider._();

/// Current theme mode from settings.

final class CurrentThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  /// Current theme mode from settings.
  const CurrentThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return currentThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$currentThemeModeHash() => r'872b8eab6cf61cd77d083cb8bb2547cdca55caa5';

/// Whether to show Dewey Decimal numbers.

@ProviderFor(showDeweyDecimal)
const showDeweyDecimalProvider = ShowDeweyDecimalProvider._();

/// Whether to show Dewey Decimal numbers.

final class ShowDeweyDecimalProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether to show Dewey Decimal numbers.
  const ShowDeweyDecimalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showDeweyDecimalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showDeweyDecimalHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showDeweyDecimal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showDeweyDecimalHash() => r'4d431890f4e209bae96f51c2834287fef717085f';
