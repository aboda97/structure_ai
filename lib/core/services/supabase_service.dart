import 'package:supabase_flutter/supabase_flutter.dart';

// ============================================================
// Thin wrapper around the Supabase SDK.
//
// Purpose: (1) centralize Supabase initialization (called from main()),
// (2) expose short, static shortcuts for the commonly used parts (auth,
// storage, realtime, querying a table) so feature code writes
// `SupabaseService.auth` instead of `Supabase.instance.client.auth`.
// ============================================================

abstract final class SupabaseService {
  const SupabaseService._();

  /// Connects the app to the Supabase project.
  /// [url] and [publishableKey] come from SupabaseConstants (they must be
  /// filled with real values before this can succeed).
  static Future<void> initialize({
    required String url,
    required String publishableKey,
  }) async {
    await Supabase.initialize(url: url, publishableKey: publishableKey);
  }

  /// The main client (database access).
  static SupabaseClient get client => Supabase.instance.client;

  /// Auth: sign in / sign up / session management.
  static GoTrueClient get auth => client.auth;

  /// File storage (upload/download files).
  static SupabaseStorageClient get storage => client.storage;

  /// Realtime subscriptions (live updates from the database).
  static RealtimeClient get realtime => client.realtime;

  /// Query a table directly, e.g. `SupabaseService.from('users').select()`.
  static SupabaseQueryBuilder from(String table) {
    return client.from(table);
  }
}
