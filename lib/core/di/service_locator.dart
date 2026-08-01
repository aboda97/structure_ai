import 'package:get_it/get_it.dart';
import 'package:structure_app/core/di/core_injection.dart';

// Features
// import '../../features/auth/di/auth_injection.dart';
// import '../../features/home/di/home_injection.dart';
// import '../../features/profile/di/profile_injection.dart';

final GetIt sl = GetIt.instance;

/// Initializes all application dependencies.
///
/// Order matters:
/// 1. Core
/// 2. Features
Future<void> initDependencies() async {
  // ---------------- Core ----------------

  await initCore();

  // ---------------- Features ----------------

  // await initAuth();

  // await initHome();

  // await initProfile();
}
