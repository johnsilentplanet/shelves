import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Provides the Connectivity instance.
@Riverpod(keepAlive: true)
Connectivity connectivity(Ref ref) => Connectivity();

/// Stream of connectivity status changes.
@riverpod
Stream<List<ConnectivityResult>> connectivityStatus(Ref ref) =>
    ref.watch(connectivityProvider).onConnectivityChanged;

/// Whether the device is currently online.
@riverpod
Future<bool> isOnline(Ref ref) async {
  final results = await ref.watch(connectivityProvider).checkConnectivity();
  return _hasConnection(results);
}

/// Stream-based online status that updates when connectivity changes.
@riverpod
Stream<bool> isOnlineStream(Ref ref) async* {
  await for (final results in ref.watch(connectivityProvider).onConnectivityChanged) {
    yield _hasConnection(results);
  }
}

bool _hasConnection(List<ConnectivityResult> results) =>
    results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet,
    );
