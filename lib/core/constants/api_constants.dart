// ============================================================
// Central place for all API/network constants.
//
// `abstract final class` means: (a) it can never be instantiated, and
// (b) nothing can inherit from it — it is only a namespace holding static
// constants. This prevents a useless instance from ever being created and
// keeps every config value in one file.
//
// NOTE: `baseUrl` is intentionally empty. It must be set to the real
// backend URL before the app can talk to the server.
// ============================================================

abstract final class ApiConstants {
  // Private constructor so no instance can be created (this class only
  // exists to hold static constants).
  const ApiConstants._();

  /// Base URL of our REST API. Every request is sent to `baseUrl`/path.
  static const String baseUrl = '';

  /// Example endpoint path (kept as a reference for adding new ones).
  static const String loginEndpoint = '';

  /// How long the client waits for the connection to be established
  /// before giving up (30 seconds).
  static const Duration connectionTimeout = Duration(seconds: 30);

  /// How long the client waits to receive the first byte of a response.
  static const Duration receiveTimeout = Duration(seconds: 30);
}
