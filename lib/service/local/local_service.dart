import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/key_management.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static Future<void> saveCurrentLocation(
      {required LocationModal currentLocation}) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        KeyManagement.currentLocationKey, jsonEncode(currentLocation.toJson()));
  }

  static Future<LocationModal> getCurrentLocation() async {
    var prefs = await SharedPreferences.getInstance();
    var locationInfo = prefs.getString(KeyManagement.currentLocationKey) ?? '';
    if (locationInfo == '') {
      return LocationModal.nbr;
    }
    return LocationModal.fromJson(jsonDecode(locationInfo));
  }

  static LocationModal getLocationFromLocationName(
      {required String locationName}) {
    LocationModal? locationModal = LocationModal.locationListMock.firstWhere(
      (location) => location.locationName == locationName,
      orElse: () => LocationModal(
        locationId: 0,
        locationName: 'Default',
        locationAdd: 'Default Address',
        locationLatLng: const LatLng(0, 0),
      ),
    );
    return locationModal;
  }

  static Future<void> saveTimeCheckIn({required String time}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(KeyManagement.timeCheckInKey, time);
  }

  static Future<void> saveTimeCheckOutAndWorking({required String time}) async {
    var prefs = await SharedPreferences.getInstance();
    if (time == '--:--') {
      prefs.setString(KeyManagement.timeCheckOutKey, time);
      prefs.setString(KeyManagement.timeWorkingKey, '');
    } else {
      prefs.setString(KeyManagement.timeCheckOutKey, time);
      var checkInTime = prefs.getString(KeyManagement.timeCheckInKey);
      var timeWorking = DateTimeManagement.calculateWorkingTime(
          checkInTime: checkInTime!, checkOutTime: time);
      prefs.setString(KeyManagement.timeWorkingKey, timeWorking);
    }
  }

  static Future<String> getTimeCheckIn() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(KeyManagement.timeCheckInKey) ?? '';
  }

  static Future<String> getTimeCheckOut() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(KeyManagement.timeCheckOutKey) ?? '';
  }

  static Future<String> getTimeWorking() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(KeyManagement.timeWorkingKey) ?? '';
  }

  static Future<void> saveCurrentPosition(
      double latitude, double longitude) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(KeyManagement.latitudeKey, latitude);
    prefs.setDouble(KeyManagement.longitudeKey, longitude);
  }

  static Future<LatLng> getCurrentPosition() async {
    var prefs = await SharedPreferences.getInstance();
    return LatLng(prefs.getDouble(KeyManagement.latitudeKey) ?? 0,
        prefs.getDouble(KeyManagement.longitudeKey) ?? 0);
  }
}
