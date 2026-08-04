// ============================================================
// Supabase project credentials.
//
// Supabase is the backend: database, auth, storage, and realtime.
//
// IMPORTANT: both values are empty placeholders on purpose — the real URL
// and publishable key come from the Supabase dashboard and must be filled
// in before the app can connect. Never commit real keys to the repository.
// ============================================================

abstract class SupabaseConstants {
  // URL of the Supabase project (e.g. https://xyz.supabase.co).
  static String supabaseUrl = '';

  // Public "publishable" key used to initialize the Supabase client.
  // (In supabase_flutter 2.x the old `anonKey` name was renamed to
  // `publishableKey`.)
  static String supabasePublishableKey = '';
}
