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

// ============================================================
// Registers all CORE dependencies into the `sl` container.
//
// `registerLazySingleton` = get_it creates the object the FIRST time it is
// requested (`sl<T>()`), then keeps and reuses the same instance forever (a
// "singleton"). "Lazy" means: don't create it until someone needs it.
//
// IMPORTANT: registration order follows dependency order. For example
// `DioClient` needs the interceptors, and `ApiClient` needs Dio — so we
// register storage first, then interceptors, then Dio, then ApiClient.
// ============================================================

Future<void> initCore() async {
  //==============================
  // Shared Preferences
  //==============================

  // SharedPreferences is a simple key/value store (like localStorage on
  // the web) for NON-sensitive data (e.g. theme choice). We grab the
  // platform instance first because `getInstance()` is async.
  final prefs = await SharedPreferences.getInstance();

  // Register the raw plugin instance...
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  // ...and our own wrapper on top of it. The app talks to the wrapper
  // interface (SharedPrefService), never to the plugin directly, so we can
  // swap the implementation later without touching feature code.
  sl.registerLazySingleton<SharedPrefService>(
    () => SharedPrefServiceImpl(sl()),
  );

  //==============================
  // Secure Storage
  //==============================

  // Encrypted storage for SENSITIVE data (tokens). On Android/iOS this is
  // backed by the OS keychain/keystore.
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // Our abstraction around it. AuthInterceptor and RouteGuards use this
  // interface to read the access token.
  sl.registerLazySingleton<SecureStorage>(() => SecureStorageImpl(sl()));

  //==============================
  // Network
  //==============================

  // Checks whether the device has internet access. Used by repositories to
  // avoid sending requests (and failing) while offline.
  sl.registerLazySingleton(() => InternetConnection());

  // Our abstraction over the internet checker.
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //==============================
  // Interceptors
  //==============================

  // Adds the `Authorization: Bearer <token>` header to every outgoing
  // request (reads the token from secure storage).
  sl.registerLazySingleton(
    () => AuthInterceptor(storage: sl()),
  );

  // Prints request/response details in debug mode for easier debugging.
  sl.registerLazySingleton(() => LoggerInterceptor());

  //==============================
  // Dio
  //==============================

  // Creates the configured HTTP client. The two interceptors are pulled
  // from `sl` (registered just above) and glued onto Dio here.
  sl.registerLazySingleton<Dio>(
    () => DioClient(
      authInterceptor: sl(),
      loggerInterceptor: sl(),
    ).create(),
  );

  //==============================
  // Api Client
  //==============================

  // High-level wrapper around Dio. Features use this to call
  // get/post/put/patch/delete without touching Dio's API.
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  //==============================
  // Firebase Notification
  //==============================

  // Firebase Messaging singleton instance (for push notifications).
  sl.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);

  // Our abstraction over Firebase Messaging.
  sl.registerLazySingleton<NotificationService>(
    () => FirebaseNotificationService(sl()),
  );
}
