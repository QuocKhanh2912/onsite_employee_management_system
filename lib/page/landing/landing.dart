import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/dialog/dialog_custom.dart';
import 'package:onsite_employee_management_system/component/drawer/employee_drawer.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'bloc/ci_co_bloc/ci_co_bloc.dart';
import 'component/in_out_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),
        backgroundColor: ColorsManagement.green,
      ),
      endDrawer: const EmployeeDrawerCustom(),
      body: BlocListener<CiCoBloc, CiCoState>(
        listener: (context, state) {
          if (state is CheckInSuccessState || state is CheckOutSuccessState) {
            context.pushNamed(RouteNamed.homePage);
          } else if (state is FarFromLocationState) {
            showDialog(
              context: context,
              builder: (context) =>
                  DialogCustom.dialogToChangeLocation(context),
            );
          } else if (state is CheckInUnSuccessState) {
            showDialog(
                context: context,
                builder: (context) =>
                    DialogCustom.checkInUnSuccessDialog(context));
          } else if (state is CheckOutUnSuccessState) {
            showDialog(
                context: context,
                builder: (context) =>
                    DialogCustom.checkOutUnSuccessDialog(context));
          } else if (state is CheckedInState) {
            context.read<CiCoBloc>().add(CheckOutEvent());
          } else if (state is NotCheckedInState) {
            showDialog(
                context: context,
                builder: (context) {
                  print('okokokok');
                  return DialogCustom.checkInFirstWarningDialog(context);
                });
          }
        },
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Hi Kabir Ahmed!',
                style: TextStyleManagement.textNormalBlack28,
              ),
              const SizedBox(
                height: 58,
              ),
              const ShowCurrentTime(),
              const SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return BlocBuilder<CiCoBloc, CiCoState>(
                      builder: (context, state) {
                        if (state is CheckInLoadingState) {
                          return const Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              CircularProgressIndicator(),
                            ],
                          );
                        }
                        return InkWell(
                          onTap: () {
                            context.read<CiCoBloc>().add(CheckInEvent());
                          },
                          child: const InOutButton(
                            imageIcon: AssetsManagement.handIn,
                            name: 'In',
                            backGroundColor: ColorsManagement.green,
                          ),
                        );
                      },
                    );
                  }),
                  Builder(builder: (context) {
                    return BlocBuilder<CiCoBloc, CiCoState>(
                      builder: (context, state) {
                        if (state is CheckOutLoadingState ||
                            state is IsCheckInLoadingState) {
                          return const Row(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 60,
                              ),
                            ],
                          );
                        }
                        return InkWell(
                          onTap: () {
                            context.read<CiCoBloc>().add(CheckInYetEvent());
                          },
                          child: const InOutButton(
                            imageIcon: AssetsManagement.handOut,
                            name: 'Out',
                            backGroundColor:
                                ColorsManagement.backgroundOutButton,
                          ),
                        );
                      },
                    );
                  }),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
