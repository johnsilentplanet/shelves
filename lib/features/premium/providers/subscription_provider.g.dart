// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Checks for premium override in Firestore.

@ProviderFor(premiumOverride)
const premiumOverrideProvider = PremiumOverrideProvider._();

/// Checks for premium override in Firestore.

final class PremiumOverrideProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Checks for premium override in Firestore.
  const PremiumOverrideProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'premiumOverrideProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$premiumOverrideHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return premiumOverride(ref);
  }
}

String _$premiumOverrideHash() => r'256653e162610c16967c1af15f72431dc5e876b7';

/// Notifier for subscription state.

@ProviderFor(SubscriptionNotifier)
const subscriptionProvider = SubscriptionNotifierProvider._();

/// Notifier for subscription state.
final class SubscriptionNotifierProvider
    extends $NotifierProvider<SubscriptionNotifier, SubscriptionState> {
  /// Notifier for subscription state.
  const SubscriptionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionNotifierHash();

  @$internal
  @override
  SubscriptionNotifier create() => SubscriptionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionState>(value),
    );
  }
}

String _$subscriptionNotifierHash() =>
    r'1b0f77eb2f5fc0e9dbea990ab6bb8fe682239f93';

/// Notifier for subscription state.

abstract class _$SubscriptionNotifier extends $Notifier<SubscriptionState> {
  SubscriptionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SubscriptionState, SubscriptionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SubscriptionState, SubscriptionState>,
              SubscriptionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Whether the user has premium access.

@ProviderFor(isPremium)
const isPremiumProvider = IsPremiumProvider._();

/// Whether the user has premium access.

final class IsPremiumProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the user has premium access.
  const IsPremiumProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isPremiumProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isPremiumHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isPremium(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isPremiumHash() => r'd034373779e2231e5a68fe030adfb548dcd4938f';

/// Available offerings from RevenueCat.

@ProviderFor(offerings)
const offeringsProvider = OfferingsProvider._();

/// Available offerings from RevenueCat.

final class OfferingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Offerings?>,
          Offerings?,
          FutureOr<Offerings?>
        >
    with $FutureModifier<Offerings?>, $FutureProvider<Offerings?> {
  /// Available offerings from RevenueCat.
  const OfferingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offeringsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offeringsHash();

  @$internal
  @override
  $FutureProviderElement<Offerings?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Offerings?> create(Ref ref) {
    return offerings(ref);
  }
}

String _$offeringsHash() => r'ba7cea844b6c1814a700a687fa6119afa50e625c';

/// The current offering (default).

@ProviderFor(currentOffering)
const currentOfferingProvider = CurrentOfferingProvider._();

/// The current offering (default).

final class CurrentOfferingProvider
    extends
        $FunctionalProvider<
          AsyncValue<Offering?>,
          Offering?,
          FutureOr<Offering?>
        >
    with $FutureModifier<Offering?>, $FutureProvider<Offering?> {
  /// The current offering (default).
  const CurrentOfferingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentOfferingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentOfferingHash();

  @$internal
  @override
  $FutureProviderElement<Offering?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Offering?> create(Ref ref) {
    return currentOffering(ref);
  }
}

String _$currentOfferingHash() => r'b604f5b0dca88e3f5d19e1c669b80c585c0678ad';
