import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// ============================================================
// Network connectivity abstraction.
//
// Wraps the `internet_connection_checker_plus` package behind our own
// interface so feature code doesn't import a third-party package, and so
// tests can fake the connection easily (implement the interface with a
// stub that always returns true/false).
// ============================================================

/// Anything that can tell us whether the device is online.
abstract interface class NetworkInfo {
  /// True when the device has actual internet access (not just a Wi-Fi
  /// connection to a router that is itself offline).
  Future<bool> get isConnected;
}

/// Real implementation backed by the internet_connection_checker package.
final class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _checker;

  const NetworkInfoImpl(this._checker);

  @override
  Future<bool> get isConnected async {
    return _checker.hasInternetAccess;
  }
}
