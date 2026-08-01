import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class NetworkInfo {
  Future<bool> get isConnected;
}

final class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _checker;

  const NetworkInfoImpl(this._checker);

  @override
  Future<bool> get isConnected async {
    return _checker.hasInternetAccess;
  }
}
