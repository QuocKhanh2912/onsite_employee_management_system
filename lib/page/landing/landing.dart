import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          if (state is CheckInSuccessState ||
              state is CheckOutSuccessState ||
              state is CheckInSuccessButOutSideState ||
              state is CheckOutSuccessButOutSideState) {
            context.pushNamed(RouteNamed.homePage);
          }
          if (state is CheckedInState) {
            context.read<CiCoBloc>().add(CheckOutEvent());
          }
          if (state is NotCheckedInState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please check in first')));
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
