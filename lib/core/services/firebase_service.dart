import 'package:firebase_core/firebase_core.dart';

// ============================================================
// Thin wrapper around the Firebase Core SDK.
//
// It exists so the app initializes Firebase in ONE place (called from
// main() before anything else) and so other code can access the Firebase
// app through a static getter instead of repeating `Firebase.app()`.
// ============================================================

abstract final class FirebaseService {
  const FirebaseService._();

  /// Initializes the Firebase connection.
  ///
  /// NOTE: `options:` is commented out because the generated config file
  /// (`firebase_options.dart`) has not been added to the project yet.
  /// Firebase must be configured (via the FlutterFire CLI or a
  /// google-services.json) before the app can really connect.
  static Future<FirebaseApp> initialize() async {
    return Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /// Accessor for the initialized Firebase app instance.
  static FirebaseApp get app => Firebase.app();
}
