import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModal {
  final int locationId;
  String locationName;
  LatLng locationLatLng;

  LocationModal(
      {required this.locationId,
      required this.locationName,
      required this.locationLatLng});

  static LocationModal nbr = LocationModal(
      locationId: 01,
      locationName: 'NBR',
      locationLatLng: const LatLng(13.746569, 107.854658));
  static LocationModal cch = LocationModal(
      locationId: 01,
      locationName: 'CCH',
      locationLatLng: const LatLng(14.746569, 107.854658));
  static LocationModal bdbl = LocationModal(
      locationId: 01,
      locationName: 'BDBL',
      locationLatLng: const LatLng(15.746569, 107.854658));
  static LocationModal pksf = LocationModal(
      locationId: 01,
      locationName: 'PKSF',
      locationLatLng: const LatLng(16.746569, 107.854658));
  static LocationModal bb = LocationModal(
      locationId: 01,
      locationName: 'BB',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal scb = LocationModal(
      locationId: 01,
      locationName: 'SCB',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal beza = LocationModal(
      locationId: 01,
      locationName: 'BEZA',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal jbl = LocationModal(
      locationId: 01,
      locationName: 'JBL',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal dch = LocationModal(
      locationId: 01,
      locationName: 'DCH',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal ndc = LocationModal(
      locationId: 01,
      locationName: 'NDC',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal shuvastu = LocationModal(
      locationId: 01,
      locationName: 'Shuvastu',
      locationLatLng: const LatLng(17.746569, 107.854658));

  static List<LocationModal> locationList = [
    nbr,
    cch,
    bdbl,
    pksf,
    bb,
    scb,
    beza,
    jbl,
    dch,
    ndc,
    shuvastu
  ];
  static List<String> locationNameList = [
    nbr.locationName,
    cch.locationName,
    bdbl.locationName,
    pksf.locationName,
    bb.locationName,
    scb.locationName,
    beza.locationName,
    jbl.locationName,
    dch.locationName,
    ndc.locationName,
    shuvastu.locationName
  ];
}
