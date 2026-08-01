import 'package:firebase_core/firebase_core.dart';

abstract final class FirebaseService {
  const FirebaseService._();

  static Future<FirebaseApp> initialize() async {
    return Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static FirebaseApp get app => Firebase.app();
}
