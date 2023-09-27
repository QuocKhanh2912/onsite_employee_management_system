import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';

class GoogleMapCustom extends StatelessWidget {
  const GoogleMapCustom(
      {super.key, required this.currentPosition, required this.logoForMap});

  final LatLng currentPosition;
  final Uint8List logoForMap;

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    void onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return GoogleMap(
      gestureRecognizers: {
        Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
      },
      scrollGesturesEnabled: true,
      onCameraMove: (position) {},
      onMapCreated: onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition:
          CameraPosition(target: currentPosition, zoom: 15.0),
      markers: {
        Marker(
            markerId: const MarkerId('1'),
            position: LocationModal.nbr.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.nbr.locationName,
            ),
            draggable: false),
        Marker(
            markerId: const MarkerId('2'),
            position: LocationModal.cch.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.cch.locationName,
            ),
            draggable: false),
        Marker(
            markerId: const MarkerId('3'),
            position: LocationModal.bdbl.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.bdbl.locationName,
            ),
            draggable: false),
        Marker(
            markerId: const MarkerId('4'),
            position: LocationModal.pksf.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.pksf.locationName,
            ),
            draggable: false),
        Marker(
            markerId: const MarkerId('5'),
            position: LocationModal.bb.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.bb.locationName,
            ),
            draggable: false),
        Marker(
            markerId: const MarkerId('6'),
            position: LocationModal.scb.locationLatLng,
            icon: BitmapDescriptor.fromBytes(logoForMap,
                size: const Size(100, 100)),
            infoWindow: InfoWindow(
              title: LocationModal.scb.locationName,
            ),
            draggable: false),
      },
    );
  }
}
