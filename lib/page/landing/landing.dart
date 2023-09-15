import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/page/home/drawer.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

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
        backgroundColor: ColorsManagement.green,
      ),
      endDrawer: const DrawerCustom(),
      body: SafeArea(
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
                InkWell(
                  onTap: () {
                    context.goNamed(RouteNamed.declineAttendancePage);
                  },
                  child: const InOutButton(
                    imageIcon: AssetsManagement.handIn,
                    name: 'In',
                    backGroundColor: ColorsManagement.green,
                  ),
                ),
                const InOutButton(
                  imageIcon: AssetsManagement.handOut,
                  name: 'Out',
                  backGroundColor: ColorsManagement.backgroundOutButton,
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
