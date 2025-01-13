import 'package:get_storage/get_storage.dart';

class Cache {
  static final GetStorage _box = GetStorage();

  /// Initialize GetStorage. Call this once, typically in the main function.
  static Future<void> init() async {
    await GetStorage.init();
  }

  /// Save a value to cache with the given key.
  static Future<bool> set(String key, dynamic value) async {
    try {
      await _box.write(key, value);
      return true;
    } catch (e) {
      // Handle errors gracefully if needed
      return false;
    }
  }

  /// Retrieve a value from cache using the given key.
  static T? get<T>(String key) {
    try {
      return _box.read<T>(key);
    } catch (e) {
      // Handle errors gracefully if needed
      return null;
    }
  }

  /// Remove a value from cache using the given key.
  static Future<bool> remove(String key) async {
    try {
      await _box.remove(key);
      return true;
    } catch (e) {
      // Handle errors gracefully if needed
      return false;
    }
  }

  /// Check if a key exists in cache.
  static bool containsKey(String key) {
    return _box.hasData(key);
  }

  /// Clear all data from cache. Use with caution.
  static Future<bool> clear() async {
    try {
      await _box.erase();
      return true;
    } catch (e) {
      // Handle errors gracefully if needed
      return false;
    }
  }
}
