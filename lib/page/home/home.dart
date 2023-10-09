import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onsite_employee_management_system/component/dialog/dialog_custom.dart';
import 'package:onsite_employee_management_system/component/drawer/employee_drawer.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/page/home/bloc/home_bloc.dart';
import 'package:onsite_employee_management_system/page/landing/bloc/ci_co_bloc/ci_co_bloc.dart';
import 'package:onsite_employee_management_system/page/set_location/bloc/set_location_bloc.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'component/google_map_custom.dart';
import 'component/show_time_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;

  String timeCheckIn = '--:--';
  String timeCheckOut = '--:--';
  String timeWorking = '--:--';
  TextEditingController outSideDescriptionController = TextEditingController();
  LocationModal currentLocation = LocationModal.nbr;
  final HomeBloc _homeBloc = HomeBloc();
  final CiCoBloc _ciCoBloc = CiCoBloc();
  final SetLocationBloc _setLocationBloc = SetLocationBloc();

  @override
  void initState() {
    _homeBloc.add(GetInfoHomeEvent());
    _setLocationBloc.add(CheckNearLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _homeBloc,
        ),
        BlocProvider.value(value: _setLocationBloc),
        BlocProvider.value(value: _ciCoBloc)
      ],
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsManagement.green,
            foregroundColor: ColorsManagement.white,
            automaticallyImplyLeading: false,
          ),
          endDrawer: const EmployeeDrawerCustom(),
          body: MultiBlocListener(
            listeners: [
              BlocListener<SetLocationBloc, SetLocationState>(
                listener: (context, state) {
                  if (state is FarAwayLocationState) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            DialogCustom.dialogToChangeLocation(context));
                  }
                },
              ),
              BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is GetInfoHomeSuccess) {
                    setState(() {
                      timeCheckIn = state.checkInTime;
                      timeCheckOut = state.checkOutTime;
                      timeWorking = state.workingTime;
                      currentLocation = state.currentLocation;
                    });
                  }
                },
              ),
            ],
            child: WillPopScope(
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
                          Builder(builder: (context) {
                            return BlocBuilder<SetLocationBloc,
                                SetLocationState>(
                              builder: (context, state) {
                                if (state is FarAwayLocationState) {
                                  return Row(children: [
                                    Image.asset(AssetsManagement.errorIcon),
                                    RichText(
                                        text: const TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Status: ',
                                            style: TextStyleManagement
                                                .textBoldBlack20),
                                        TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  'You are not in office range: ',
                                              style: TextStyleManagement
                                                  .textNormalRed18)
                                        ])
                                      ],
                                    ))
                                  ]);
                                }
                                return Row(children: [
                                  Image.asset(AssetsManagement.doneIcon),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                      text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Status: ',
                                          style: TextStyleManagement
                                              .textBoldBlack20),
                                      TextSpan(children: [
                                        TextSpan(
                                            text: 'Now you are at NBR',
                                            style: TextStyleManagement
                                                .textNormalBlack18)
                                      ])
                                    ],
                                  ))
                                ]);
                              },
                            );
                          }),
                          const SizedBox(
                            height: 27,
                          ),
                          SizedBox(
                              height: 233,
                              child: BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  if (state is GetInfoHomeSuccess) {
                                    var currentPosition = state.currentPosition;
                                    var logoForMap = state.logoForMap;
                                    return GoogleMapCustom(
                                      currentPosition: currentPosition,
                                      logoForMap: logoForMap,
                                    );
                                  }
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
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
                                    },
                                  )
                                ]),
                          ),
                          const SizedBox(
                            height: 54,
                          ),
                          BlocBuilder<SetLocationBloc, SetLocationState>(
                            builder: (context, state) {
                              if (state is FarAwayLocationState) {
                                return InkWell(
                                  onTap: () =>
                                      context.pushNamed(RouteNamed.landingPage),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 42),
                                    child: RichText(
                                        maxLines: 4,
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    'Note: Please go inside Office range then  ',
                                                style: TextStyleManagement
                                                    .textNormalBlack20),
                                            TextSpan(children: [
                                              TextSpan(
                                                text: 'try again!',
                                                style: TextStyleManagement
                                                    .textUnderlineRed18,
                                              )
                                            ])
                                          ],
                                        )),
                                  ),
                                );
                              }
                              if (state is NearLocationState) {
                                return InkWell(
                                  onTap: () {
                                    context.pushNamed(RouteNamed.landingPage);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ShowTimeWidget(
                                          checkTime: true,
                                          checkLate: true,
                                          imageClock:
                                              AssetsManagement.checkInClockIcon,
                                          typeTime: 'Check In',
                                          time: timeCheckIn == ''
                                              ? '--:--'
                                              : timeCheckIn),
                                      ShowTimeWidget(
                                          checkTime: true,
                                          checkLate: false,
                                          imageClock: AssetsManagement
                                              .checkOutClockIcon,
                                          typeTime: 'Check Out',
                                          time: timeCheckOut == ''
                                              ? '--:--'
                                              : timeCheckOut),
                                      ShowTimeWidget(
                                          checkTime: false,
                                          checkLate: false,
                                          imageClock:
                                              AssetsManagement.workingClockIcon,
                                          typeTime: 'Working Hr’s',
                                          time: timeWorking == ''
                                              ? '--:--'
                                              : timeWorking)
                                    ],
                                  ),
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
