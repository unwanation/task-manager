import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static const storage = FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static isExist(String key) async {
    return await storage.containsKey(key: key);
  }
}
