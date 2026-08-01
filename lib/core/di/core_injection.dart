import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structure_app/core/services/notification_service.dart';
import 'package:structure_app/core/storage/secure_storage.dart';
import 'package:structure_app/core/storage/shared_pref_service.dart';
import '../network/api_client.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../network/interceptors/logger_interceptor.dart';

import 'service_locator.dart';

Future<void> initCore() async {
  //==============================
  // Shared Preferences
  //==============================

  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<SharedPrefService>(
    () => SharedPrefServiceImpl(sl()),
  );

  //==============================
  // Secure Storage
  //==============================
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl(sl()));

  //==============================
  // Network
  //==============================

  sl.registerLazySingleton(() => InternetConnection());

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //==============================
  // Interceptors
  //==============================

  sl.registerLazySingleton(
    () => AuthInterceptor(secureStorage: sl(), storage: sl()),
  );

  sl.registerLazySingleton(() => LoggerInterceptor());

  //==============================
  // Dio
  //==============================

  sl.registerLazySingleton<Dio>(
    () => DioClient(
      authInterceptor: sl(),
      loggerInterceptor: sl(),
      constant: sl(),
    ).create(),
  );

  //==============================
  // Api Client
  //==============================

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  //==============================
  // Firebase Notification
  //==============================

  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

  sl.registerLazySingleton<NotificationService>(
    () => FirebaseNotificationService(sl()),
  );
}
