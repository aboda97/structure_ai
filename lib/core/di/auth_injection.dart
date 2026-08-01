import 'package:get_it/get_it.dart';
import '../../../core/di/service_locator.dart';

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
