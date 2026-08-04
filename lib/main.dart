import 'package:flutter/material.dart';
import 'package:structure_app/core/constants/supabase_constants.dart';
import 'app.dart';
import 'core/di/service_locator.dart';
import 'core/services/firebase_service.dart';
import 'core/services/supabase_service.dart';

// ============================================================
// App entry point — the FIRST thing that runs when the app starts.
//
// Everything here is async (awaited) because the services below must be
// fully ready BEFORE the first screen is shown. If we skipped these steps,
// a screen could crash later when it tries to use Firebase, Supabase, or
// an injected dependency that isn't ready yet.
// ============================================================

Future<void> main() async {
  // Makes sure the binding between our Dart code and the native platform
  // (Android/iOS/web/desktop) is initialized before we touch any platform
  // API. Without this, async work before runApp() can fail on some platforms.
  WidgetsFlutterBinding.ensureInitialized();

  // 1) Firebase: used for push notifications (via Firebase Messaging).
  await FirebaseService.initialize();

  // 2) Supabase: our backend (database + auth). The URL and the publishable
  // key come from SupabaseConstants — they must be filled in before the app
  // can connect to a real project.
  await SupabaseService.initialize(
    url: SupabaseConstants.supabaseUrl,
    publishableKey: SupabaseConstants.supabasePublishableKey,
  );

  // 3) Dependency Injection: registers every service (storage, network,
  // interceptors, Dio, ...) into the global `sl` container so any part of
  // the app can request them with `sl()`. Must run after the services it
  // depends on are up.
  await initDependencies();

  // 4) Finally, show the UI. `App` builds the MaterialApp that owns the
  // router, the themes, and the whole screen tree.
  runApp(const App());
}
