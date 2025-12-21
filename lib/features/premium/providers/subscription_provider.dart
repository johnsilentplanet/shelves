import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/remote_service_providers.dart';
import '../../auth/providers/auth_provider.dart';

part 'subscription_provider.freezed.dart';
part 'subscription_provider.g.dart';

/// The premium entitlement identifier in RevenueCat.
const _premiumEntitlementId = 'premium';

/// Subscription state.
@freezed
sealed class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(false) bool isLoading,
    @Default(false) bool isPremium,
    @Default(false) bool hasOverride,
    CustomerInfo? customerInfo,
    String? error,
  }) = _SubscriptionState;
}

/// Checks for premium override in Firestore.
@riverpod
Future<bool> premiumOverride(Ref ref) async {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return false;

  final firestoreService = ref.watch(firestoreServiceProvider);
  final profile = await firestoreService.getUserProfile(userId);

  return profile?.hasPremiumOverride ?? false;
}

/// Notifier for subscription state.
@Riverpod(keepAlive: true)
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  SubscriptionState build() {
    // Check entitlements on initialization
    _checkEntitlements();
    return const SubscriptionState(isLoading: true);
  }

  /// Checks the current subscription entitlements.
  Future<void> _checkEntitlements() async {
    try {
      // Check Firestore override first
      final hasOverride = await ref.read(premiumOverrideProvider.future);
      if (hasOverride) {
        state = SubscriptionState(
          isPremium: true,
          hasOverride: true,
        );
        return;
      }

      // Check RevenueCat entitlements
      final customerInfo = await Purchases.getCustomerInfo();
      final isPremium = customerInfo.entitlements.active
          .containsKey(_premiumEntitlementId);

      state = SubscriptionState(
        isPremium: isPremium,
        customerInfo: customerInfo,
      );
    } catch (e) {
      state = SubscriptionState(error: e.toString());
    }
  }

  /// Refreshes the subscription status.
  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    await _checkEntitlements();
  }

  /// Purchases a package.
  Future<bool> purchase(Package package) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // ignore: deprecated_member_use
      final result = await Purchases.purchasePackage(package);
      final customerInfo = result.customerInfo;
      final isPremium = customerInfo.entitlements.active
          .containsKey(_premiumEntitlementId);

      state = SubscriptionState(
        isPremium: isPremium,
        customerInfo: customerInfo,
      );
      return isPremium;
    } on PurchasesErrorCode catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _mapPurchaseError(e),
      );
      return false;
    }
  }

  /// Restores previous purchases.
  Future<bool> restorePurchases() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final customerInfo = await Purchases.restorePurchases();
      final isPremium = customerInfo.entitlements.active
          .containsKey(_premiumEntitlementId);

      state = SubscriptionState(
        isPremium: isPremium,
        customerInfo: customerInfo,
      );
      return isPremium;
    } on PurchasesErrorCode catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _mapPurchaseError(e),
      );
      return false;
    }
  }

  /// Clears any error state.
  void clearError() {
    state = state.copyWith(error: null);
  }

  String _mapPurchaseError(PurchasesErrorCode code) {
    switch (code) {
      case PurchasesErrorCode.purchaseCancelledError:
        return 'Purchase was cancelled';
      case PurchasesErrorCode.purchaseNotAllowedError:
        return 'Purchase not allowed';
      case PurchasesErrorCode.purchaseInvalidError:
        return 'Invalid purchase';
      case PurchasesErrorCode.productNotAvailableForPurchaseError:
        return 'Product not available';
      case PurchasesErrorCode.networkError:
        return 'Network error. Please check your connection';
      case PurchasesErrorCode.receiptAlreadyInUseError:
        return 'This subscription is already in use by another account';
      default:
        return 'An error occurred. Please try again';
    }
  }
}

/// Whether the user has premium access.
@riverpod
bool isPremium(Ref ref) {
  final subscription = ref.watch(subscriptionProvider);
  return subscription.isPremium;
}

/// Available offerings from RevenueCat.
@riverpod
Future<Offerings?> offerings(Ref ref) async {
  try {
    return await Purchases.getOfferings();
  } catch (_) {
    return null;
  }
}

/// The current offering (default).
@riverpod
Future<Offering?> currentOffering(Ref ref) async {
  final offerings = await ref.watch(offeringsProvider.future);
  return offerings?.current;
}
