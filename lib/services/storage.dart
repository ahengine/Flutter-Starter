import 'package:get_storage/get_storage.dart';

class Storage {
  static final _box = GetStorage();

  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';

  static Future<void> set(String key, dynamic value) async =>
      await _box.write(key, value);

  static bool has(String key) => _box.hasData(key);

  static Future<dynamic> get(String key) async => await _box.read(key);
}
