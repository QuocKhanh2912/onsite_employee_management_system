import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/bloc/ci_co_bloc/ci_co_bloc.dart';
import 'package:onsite_employee_management_system/component/drawer/drawer.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/page/home/bloc/home_bloc.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'component/show_time_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.746519, 107.854663);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String? timeCheckIn;
  String? timeCheckOut;
  String? timeWorking;
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(GetCurrentLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsManagement.green,
            foregroundColor: ColorsManagement.white,
            automaticallyImplyLeading: false,
          ),
          endDrawer: const DrawerCustom(),
          body: WillPopScope(
            onWillPop: () async => false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
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
                          Image.asset(AssetsManagement.doneIcon),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                              text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Status: ',
                                  style: TextStyleManagement.textBoldBlack20),
                              TextSpan(children: [
                                TextSpan(
                                    text: 'Now you are at NBR',
                                    style:
                                        TextStyleManagement.textNormalBlack18)
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
                              onMapCreated: onMapCreated,
                              initialCameraPosition:
                                  CameraPosition(target: _center, zoom: 15.0),
                            )),
                        const SizedBox(
                          height: 21,
                        ),
                        InkWell(
                          onTap: () {
                            context.pushNamed(RouteNamed.setLocationPage);
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AssetsManagement.positionIcon),
                                const SizedBox(
                                  width: 10,
                                ),
                                BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) {
                                    if (state is GetCurrentLocationSuccess) {
                                      var currentLocation =
                                          state.currentLocation;
                                      return Expanded(
                                        child: RichText(
                                            maxLines: 4,
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                    text: 'Your Location: ',
                                                    style: TextStyleManagement
                                                        .textBoldBlack20),
                                                TextSpan(children: [
                                                  TextSpan(
                                                    text: currentLocation
                                                        .locationAdd,
                                                    style: TextStyleManagement
                                                        .textNormalBlack20,
                                                  )
                                                ])
                                              ],
                                            )),
                                      );
                                    }
                                    return const Expanded(
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  },
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        BlocBuilder<CiCoBloc, CiCoState>(
                          builder: (context, state) {
                            if (state is CheckInSuccessState &&
                                timeCheckIn == null) {
                              timeCheckIn = state.timeCheckIn;
                            }

                            String currentCheckInTime = timeCheckIn ?? '--:--';

                            if (state is CheckOutSuccessState &&
                                timeCheckOut == null) {
                              timeCheckOut = state.timeCheckOut;
                            }
                            String currentCheckOutTime =
                                timeCheckOut ?? '--:--';
                            if (state is CheckOutSuccessState &&
                                timeWorking == null) {
                              timeWorking =
                                  DateTimeManagement.calculateWorkingTime(
                                      checkInTime: currentCheckInTime,
                                      checkOutTime: state.timeCheckOut);
                            }
                            String workingTime = timeWorking ?? '--:--';
                            return InkWell(
                              onTap: () {
                                context.pushNamed(RouteNamed.landingPage);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShowTimeWidget(
                                    imageClock:
                                        AssetsManagement.checkInClockIcon,
                                    typeTime: 'Check In',
                                    time: currentCheckInTime,
                                  ),
                                  ShowTimeWidget(
                                    imageClock:
                                        AssetsManagement.checkOutClockIcon,
                                    typeTime: 'Check Out',
                                    time: currentCheckOutTime,
                                  ),
                                  ShowTimeWidget(
                                    imageClock:
                                        AssetsManagement.workingClockIcon,
                                    typeTime: 'Working Hr’s',
                                    time: workingTime,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
