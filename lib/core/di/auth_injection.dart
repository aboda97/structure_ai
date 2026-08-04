// ============================================================
// TEMPLATE — registration module for the AUTH feature.
//
// This file is intentionally "empty" (only comments): it is a copy-paste
// template that shows the EXACT layering order the team expects for any
// feature's DI. When implementing auth, replace the comments below with
// real registrations, following this order:
//
//   1. Data sources  → remote data source that talks to the API
//   2. Repositories  → combine data sources + network info (+ caching)
//   3. Use cases     → single business action (login, register, logout)
//   4. Cubits        → state management, registered with registerFactory
//
// Rule of thumb: use `registerLazySingleton` for data sources, repositories
// and use cases, and `registerFactory` for Cubits (each screen gets its own
// fresh state instance).
// ============================================================

Future<void> initAuth() async {
  //==============================
  // Data Sources
  //==============================

  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(
  //     apiClient: sl(),
  //   ),
  // );

  //==============================
  // Repository
  //==============================

  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     remoteDataSource: sl(),
  //     networkInfo: sl(),
  //   ),
  // );

  //==============================
  // Use Cases
  //==============================

  // sl.registerLazySingleton(
  //   () => LoginUseCase(sl()),
  // );

  // sl.registerLazySingleton(
  //   () => RegisterUseCase(sl()),
  // );

  // sl.registerLazySingleton(
  //   () => LogoutUseCase(sl()),
  // );

  //==============================
  // Cubits
  //==============================

  // sl.registerFactory(
  //   () => LoginCubit(
  //     loginUseCase: sl(),
  //   ),
  // );

  // sl.registerFactory(
  //   () => RegisterCubit(
  //     registerUseCase: sl(),
  //   ),
  // );
}
