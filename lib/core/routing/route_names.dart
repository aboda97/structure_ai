// ============================================================
// String paths for every screen in the app.
//
// Centralizing them means navigation code never writes raw strings like
// '/login' — and if a path changes, we change it in exactly one place.
// Misspelling a constant name is a compile-time error, while misspelling
// a raw string is a silent runtime bug.
// ============================================================

abstract final class RouteNames {
  const RouteNames._();

  /// Root path "/" — the splash screen shown while the app loads.
  static const splash = '/';

  /// Login screen.
  static const login = '/login';
}
