import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/page/home/drawer.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';
import 'package:onsite_employee_management_system/src/locations.dart' as locations;


class DeclineAttendancePage extends StatefulWidget {
  const DeclineAttendancePage({super.key});

  @override
  State<DeclineAttendancePage> createState() => _DeclineAttendancePageState();
}

class _DeclineAttendancePageState extends State<DeclineAttendancePage> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManagement.green,
        ),
        endDrawer: const DrawerCustom(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 37),
                  const ShowCurrentTime(),
                  const SizedBox(
                    height: 55,
                  ),
                  Row(children: [
                    Image.asset(AssetsManagement.errorIcon),
                    RichText(
                        text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Status: ',
                            style: TextStyleManagement.textBoldBlack20),
                        TextSpan(children: [
                          TextSpan(
                              text: 'You are not in office range: ',
                              style: TextStyleManagement.textNormalRed18)
                        ])
                      ],
                    ))
                  ]),
                  const SizedBox(
                    height: 27,
                  ),
                   SizedBox(
                    height: 233,
                     child: GoogleMap(
                       onMapCreated: _onMapCreated,
                       initialCameraPosition: const CameraPosition(
                         target: LatLng(13.746420, 107.854950),
                         zoom: 15,
                       ),
                       markers: _markers.values.toSet(),
                     ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.asset(AssetsManagement.positionIcon),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RichText(
                          maxLines: 4,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Your Location: ',
                                  style: TextStyleManagement.textBoldBlack20),
                              TextSpan(children: [
                                TextSpan(
                                  text:
                                      'Block C, 24/A Tajmahal Road (Ring Road, Near Shia Mosque, Dhaka 1207',
                                  style: TextStyleManagement.textNormalBlack20,
                                )
                              ])
                            ],
                          )),
                    )
                  ]),
                  const SizedBox(
                    height: 54,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: RichText(
                        maxLines: 4,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: 'Note: Please go inside Office range then  ',
                                style: TextStyleManagement.textNormalBlack20),
                            TextSpan(children: [
                              TextSpan(
                                text:
                                'try again!',
                                style: TextStyleManagement.textUnderlineRed18,
                              )
                            ])
                          ],
                        )),
                  )
                ]),
          ),
        ));
  }
}
