import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedPrefService {
  Future<bool> saveString(String key, String value);

  String? getString(String key);

  Future<bool> saveBool(String key, bool value);

  bool? getBool(String key);

  Future<bool> saveInt(String key, int value);

  int? getInt(String key);

  Future<bool> saveDouble(String key, double value);

  double? getDouble(String key);

  Future<bool> remove(String key);

  Future<bool> clear();
}

final class SharedPrefServiceImpl implements SharedPrefService {
  final SharedPreferences _prefs;

  const SharedPrefServiceImpl(this._prefs);

  @override
  Future<bool> saveString(String key, String value) {
    return _prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<bool> saveBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  Future<bool> saveInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  Future<bool> saveDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  @override
  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  @override
  Future<bool> clear() {
    return _prefs.clear();
  }
}
