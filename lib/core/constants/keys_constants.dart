// ============================================================
// Names ("keys") used to store/read values in local storage.
//
// Storing every key as a constant prevents typos: a mistyped raw string
// is a silent bug that only shows up at runtime, while a misspelled
// constant name fails at compile time.
// ============================================================

abstract final class KeysConstants {
  const KeysConstants._();

  /// Access token (saved after login) — stored in SECURE storage.
  static const accessToken = "access_token";

  /// Refresh token — used to get a new access token when it expires.
  static const refreshToken = "refresh_token";

  /// ID of the logged-in user.
  static const userId = "user_id";

  /// Language/locale chosen by the user.
  static const locale = "locale";

  /// Theme preference (light/dark/system).
  static const themeMode = "theme_mode";

  /// Whether the user already saw the onboarding screens.
  static const onboardingSeen = "onboarding_seen";
}
