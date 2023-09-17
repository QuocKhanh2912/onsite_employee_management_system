import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModal {
  final int locationId;
  String locationName;
  String locationAdd;
  LatLng locationLatLng;

  LocationModal(
      {required this.locationId,
      required this.locationName,
      required this.locationAdd,
      required this.locationLatLng});

  static LocationModal nbr = LocationModal(
      locationId: 01,
      locationName: 'NBR',
      locationAdd:
          'Block C, 24/A Tajmahal Road (Ring Road, Near Shia Mosque, Dhaka 1207',
      locationLatLng: const LatLng(13.746569, 107.854658));
  static LocationModal cch = LocationModal(
      locationId: 01,
      locationName: 'CCH',
      locationAdd: 'Segun Bagicha Rd, Dhaka 1000',
      locationLatLng: const LatLng(14.746569, 107.854658));
  static LocationModal bdbl = LocationModal(
      locationId: 01,
      locationName: 'BDBL',
      locationAdd:
          'PLOT NO.2, HOTEL KP INN, AIRPORT ROAD, Ajni Square, Samarth Nagar East',
      locationLatLng: const LatLng(15.746569, 107.854658));
  static LocationModal pksf = LocationModal(
      locationId: 01,
      locationName: 'PKSF',
      locationAdd:
          '001, Ground Floor, Himalaya Harmony Apartments, Near, Aath Rasta Chowk',
      locationLatLng: const LatLng(16.746569, 107.854658));
  static LocationModal bb = LocationModal(
      locationId: 01,
      locationName: 'BB',
      locationAdd:
          'PLOT NO.2, HOTEL KP INN, AIRPORT ROAD, Ajni Square, Samarth Nagar East',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal scb = LocationModal(
      locationId: 01,
      locationName: 'SCB',
      locationAdd: '2, Shreehari nagar, No1, Manewada - Besa Rd, Nagpur',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal beza = LocationModal(
      locationId: 01,
      locationName: 'BEZA',
      locationAdd: 'Omkar Nagar, Nagpur',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal jbl = LocationModal(
      locationId: 01,
      locationName: 'JBL',
      locationAdd:
          'Wardha Rd, opposite Airport, New Manish Nagar, Sonegaon, Nagpur',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal dch = LocationModal(
      locationId: 01,
      locationName: 'DCH',
      locationAdd:
          'Plot no.270 Beltarodi Bus Stop, Beltarodi Rd, Beltarodi, Nagpur',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal ndc = LocationModal(
      locationId: 01,
      locationName: 'NDC',
      locationAdd: 'Wardha Rd, Chinch Bhawan, Nagpur, Maharashtra',
      locationLatLng: const LatLng(17.746569, 107.854658));
  static LocationModal shuvastu = LocationModal(
      locationId: 01,
      locationName: 'Shuvastu',
      locationAdd: 'Narsala, Brahma Nagar, Dighori, Nagpur, Maharashtra',
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

  Map<String, dynamic> toJson() {
    return {
      'locationId': locationId,
      'locationName': locationName,
      'locationAdd': locationAdd,
      'locationLatLng': locationLatLng,
    };
  }

  static LocationModal fromJson(Map<String, dynamic> json) {
    final locationLatLngList = json['locationLatLng'] as List<dynamic>;
    final double latitude = locationLatLngList[0];
    final double longitude = locationLatLngList[1];
    return LocationModal(
        locationAdd: json['locationAdd'],
        locationId: json['locationId'],
        locationLatLng: LatLng(latitude, longitude),
        locationName: json['locationName']);
  }
}
