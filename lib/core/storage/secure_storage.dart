import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ============================================================
// Encrypted storage abstraction (for SENSITIVE data: tokens, etc.).
//
// Backed by flutter_secure_storage, which uses the operating system's
// secure vault (Keychain on iOS/macOS, Keystore/EncryptedSharedPrefs on
// Android). The app NEVER stores tokens in SharedPreferences — that would
// be insecure.
//
// The interface lets us swap the backend or provide a fake in tests.
// ============================================================

/// Contract for secure key/value storage.
abstract interface class SecureStorage {
  /// Encrypt and save a [value] under [key].
  Future<void> write({required String key, required String value});

  /// Read the saved value for [key] (null if never saved).
  Future<String?> read({required String key});

  /// Delete the value stored under [key].
  Future<void> delete({required String key});

  /// Wipe ALL secure values (used on logout).
  Future<void> deleteAll();
}

/// Real implementation over flutter_secure_storage.
final class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  const SecureStorageImpl(this._storage);

  @override
  Future<void> write({required String key, required String value}) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future<void> delete({required String key}) {
    return _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}
