import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _storage = const FlutterSecureStorage();

  Future<String?> getValue({required String key}) async {
    String? value = await _storage.read(key: key);

    return value;
  }

  Future<bool> checkValueAvailability({required String key}) async {
    bool availability = (await getValue(key: key)) != null ? true : false;
    return availability;
  }

  Future<void> setValue({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }
}
