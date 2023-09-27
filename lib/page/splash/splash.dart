import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/service/geolocation/determine_position.dart';
import 'package:onsite_employee_management_system/service/local/local_service.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';

import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

final SplashBloc _splashBloc = SplashBloc();

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController linearController;

  @override
  void initState() {
    linearController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..addListener(() {
        setState(() {});
      });
    linearController
        .forward()
        .then((value) => GeolocationService.determinePosition())
        .then((value) =>
            LocalService.saveCurrentPosition(value.latitude, value.longitude))
        .then((value) => _splashBloc.add(SplashLoadingEvent()));
    super.initState();
  }

  @override
  void dispose() {
    linearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _splashBloc,
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashFinishState) {
                context.goNamed(RouteNamed.authenticationOptionPage);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(AssetsManagement.bigLogo),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35)),
                      child: LinearProgressIndicator(
                          value: linearController.value,
                          backgroundColor: ColorsManagement.white,
                          valueColor: const AlwaysStoppedAnimation(
                              ColorsManagement.green)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
