import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/page/landing/bloc/ci_co_bloc/ci_co_bloc.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CiCoBloc, CiCoState>(
        listener: (context, state) {
          if (state is CheckedInState) {
            context.pushNamed(RouteNamed.homePage);
          }
          if (state is NotCheckedInState) {
            context.pushNamed(RouteNamed.landingPage);
          }
        },
        child: Column(children: [
          const SizedBox(
            height: 64,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Image.asset(AssetsManagement.roleSelection)),
          const SizedBox(
            height: 50,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<CiCoBloc>().add(CheckInYetEvent());
                    },
                    child: Stack(
                      children: [
                        Image.asset(AssetsManagement.employeeIcon),
                        Container(
                            margin: const EdgeInsets.only(left: 15, top: 60),
                            child: const Text(
                              'Employee',
                              style: TextStyleManagement.textNormalWhite14,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  InkWell(
                    onTap: () => context.pushNamed(RouteNamed.attendancePage),
                    child: Stack(
                      children: [
                        Image.asset(AssetsManagement.supervisorIcon),
                        Container(
                            margin: const EdgeInsets.only(left: 12, top: 60),
                            child: const Text(
                              'Supervisor',
                              style: TextStyleManagement.textNormalWhite14,
                            ))
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(AssetsManagement.smallLogo))),
        ]),
      ),
    );
  }
}
