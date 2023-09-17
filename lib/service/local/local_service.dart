import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
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

  static LocationModal getLocationFromLocationName({required String locationName}) {
    LocationModal? locationModal = LocationModal.locationList.firstWhere(
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
}
