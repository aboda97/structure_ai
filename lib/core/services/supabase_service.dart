import 'package:supabase_flutter/supabase_flutter.dart';

abstract final class SupabaseService {
  const SupabaseService._();

  static Future<void> initialize({
    required String url,
    required String anonKey,
  }) async {
    await Supabase.initialize(url: url, anonKey: anonKey);
  }

  static SupabaseClient get client => Supabase.instance.client;

  static GoTrueClient get auth => client.auth;

  static SupabaseStorageClient get storage => client.storage;

  static RealtimeClient get realtime => client.realtime;

  static SupabaseQueryBuilder from(String table) {
    return client.from(table);
  }
}
