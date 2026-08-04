import 'package:firebase_messaging/firebase_messaging.dart';

// ============================================================
// Push-notification abstraction.
//
// The interface (NotificationService) is what feature code depends on. The
// real implementation (FirebaseNotificationService) wraps Firebase
// Messaging. Because features only know the interface, we can swap the
// implementation or fake it in tests without touching feature code.
// ============================================================

/// Contract for everything notification-related the app needs.
abstract interface class NotificationService {
  /// Initialize Firebase Messaging.
  Future<void> initialize();

  /// Ask the user for permission to show notifications.
  Future<NotificationSettings> requestPermission();

  /// The device's push-notification token (sent to our backend so it can
  /// target this device).
  Future<String?> getDeviceToken();

  /// Stream that emits a NEW token whenever the old one is rotated.
  Stream<String> onTokenRefresh();

  /// Stream of notifications received while the app is in the foreground.
  Stream<RemoteMessage> onForegroundMessage();

  /// Stream of notifications the USER TAPPED to open the app.
  Stream<RemoteMessage> onMessageOpenedApp();
}

/// Real implementation backed by Firebase Messaging.
final class FirebaseNotificationService implements NotificationService {
  final FirebaseMessaging messaging;

  const FirebaseNotificationService(this.messaging);

  @override
  Future<void> initialize() async {
    await messaging.setAutoInitEnabled(true);
  }

  @override
  Future<NotificationSettings> requestPermission() {
    return messaging.requestPermission();
  }

  @override
  Future<String?> getDeviceToken() {
    return messaging.getToken();
  }

  @override
  Stream<String> onTokenRefresh() {
    return messaging.onTokenRefresh;
  }

  @override
  Stream<RemoteMessage> onForegroundMessage() {
    return FirebaseMessaging.onMessage;
  }

  @override
  Stream<RemoteMessage> onMessageOpenedApp() {
    return FirebaseMessaging.onMessageOpenedApp;
  }
}
