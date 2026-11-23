import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:otlop_app/core/cache/secure_keys.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  Future<void> saveAuthData({required String token}) async {
    debugPrint('SAVE called, length=${token.length}');
    await _storage.write(key: SecureKeys.token, value: token);
    debugPrint('SAVE done');
  }

  Future<String?> getToken() async {
    final token = await _storage.read(key: SecureKeys.token);
    debugPrint('READ -> ${token == null ? 'null' : 'length ${token.length}'}');
    return token;
  }

  Future<void> clearCache() async {
    await _storage.delete(key: SecureKeys.token);
  }
}
