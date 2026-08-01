import 'package:firebase_messaging/firebase_messaging.dart';

abstract interface class NotificationService {
  /// Initialize Firebase Messaging
  Future<void> initialize();

  /// Request notification permission
  Future<NotificationSettings> requestPermission();

  /// Current FCM Token
  Future<String?> getDeviceToken();

  /// Called when token changes
  Stream<String> onTokenRefresh();

  /// Foreground notifications
  Stream<RemoteMessage> onForegroundMessage();

  /// User taps notification
  Stream<RemoteMessage> onMessageOpenedApp();
}

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
