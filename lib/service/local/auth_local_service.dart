import 'package:hive/hive.dart';
import 'package:onsite_employee_management_system/utils/key_management.dart';

class AuthLocalService {
  static Future<void> saveTokenToLocal({required String token}) async {
    var box = await Hive.openBox('authentication');
    await box.put(KeyManagement.tokenKey,token);
  }

  static Future<String> getTokenToLocal() async {
    var box = await Hive.openBox('authentication');
    var token = box.get(KeyManagement.tokenKey);
    return token;
  }
}
