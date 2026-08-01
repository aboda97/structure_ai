import 'package:flutter/material.dart';
import 'package:structure_app/core/constants/supabase_constants.dart';
import 'app.dart';
import 'core/di/service_locator.dart';
import 'core/services/firebase_service.dart';
import 'core/services/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Firebase
  await FirebaseService.initialize();

  /// Initialize Supabase
  await SupabaseService.initialize(
    url: SupabaseConstants.supabaseUrl,
    anonKey: SupabaseConstants.supabaseAnonKey,
  );

  /// Dependency Injection
  await initDependencies();

  runApp(const App());
}
