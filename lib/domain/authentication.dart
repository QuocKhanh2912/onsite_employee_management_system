import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:onsite_employee_management_system/data/user/user_modal.dart';
import 'package:onsite_employee_management_system/service/local/auth_local_service.dart';

class AuthService {
  static final dio = Dio();

  static Future<String> signInByEmail(
      {required String email, required String password}) async {
    try {
      Response response;
      response = await dio.post('https://bluemployees.online/api/v1/login',
          data: {"Email": email, "Password": password});
      return response.data;
    } catch (e) {
      return '';
    }
  }

  static Future<UserDataModel?> checkInActivity() async {
    try {
      var token = await AuthLocalService.getTokenToLocal();
      dio.options.headers = {'authorization': token};
      Response response;
      response = await dio.put(
          'https://bluemployees.online/api/v1/activities/action',
          data: {'is_check_in': true});
      var jsonData = response.data;
      var userInfo = UserDataModel.fromJson(jsonData);
      return userInfo;
    } catch (e) {
      return null;
    }
  }

  static Future<UserDataModel?> checkOutActivity() async {
    try {
      var token = await AuthLocalService.getTokenToLocal();
      dio.options.headers = {'authorization': token};
      Response response;
      response = await dio.put(
          'https://bluemployees.online/api/v1/activities/action',
          data: {'is_check_in': false});
      var jsonData = response.data;
      var userInfo = UserDataModel.fromJson(jsonData);
      return userInfo;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isCheckIn() async {
    try {
      var token = await AuthLocalService.getTokenToLocal();
      dio.options.headers = {'authorization': token};
      Response response;
      response =
          await dio.get('https://bluemployees.online/api/v1/activities/today');
      var jsonData = response.data;
      var userInfo = UserDataModel.fromJson(jsonData);
      return userInfo.status == 'Available' ? false : true;
    } catch (e) {
      return false;
    }
  }
}
