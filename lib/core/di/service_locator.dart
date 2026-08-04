import 'package:get_it/get_it.dart';
import 'package:structure_app/core/di/core_injection.dart';

// Features
// import '../../features/auth/di/auth_injection.dart';
// import '../../features/home/di/home_injection.dart';
// import '../../features/profile/di/profile_injection.dart';

// ============================================================
// Service Locator — the heart of our Dependency Injection (DI).
//
// What is DI for? Instead of every class creating its own dependencies
// (`new ApiClient(new Dio(...))`) — which makes code hard to test and to
// change — we register every dependency ONCE here, and any class asks for
// it with `sl<T>()`. get_it creates and caches the instances for us.
//
// `sl` is a singleton: there is exactly one container for the whole app.
// ============================================================

// The global service locator instance. Use `sl<T>()` anywhere to get an
// already-registered dependency of type T.
final GetIt sl = GetIt.instance;

/// Initializes all application dependencies.
///
/// Order matters:
/// 1. Core (storage, network, services used by every feature)
/// 2. Features (they depend on the core objects, so they load second)
///
/// New features must be registered here by un-commenting/adding their
/// `init*()` call, following the same pattern.
Future<void> initDependencies() async {
  // ---------------- Core ----------------

  await initCore();

  // ---------------- Features ----------------

  // await initAuth();

  // await initHome();

  // await initProfile();
}
