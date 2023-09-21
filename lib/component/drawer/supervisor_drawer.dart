import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/drawer/component/item_drawer.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class SupervisorDrawerCustom extends StatelessWidget {
  const SupervisorDrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
          width: 275,
          child: Column(
            children: [
              Container(
                color: ColorsManagement.green,
                height: 143,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsManagement.supervisorAvatar),
                      const SizedBox(height: 9),
                      const Text(
                        'Hello! MD. Sharafat',
                        style: TextStyleManagement.textNormalWhite21,
                      )
                    ]),
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(height: 31),
                    InkWell(
                      onTap: () {},
                      child: const ItemDrawer(
                        imageIcon: AssetsManagement.attendanceIcon,
                        itemName: 'Attendance',
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        context.pushNamed(RouteNamed.lateComerPage);
                      },
                      child: const ItemDrawer(
                        imageIcon: AssetsManagement.lateComerIcon,
                        itemName: 'Late Comers',
                      ),
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () =>
                          context.pushNamed(RouteNamed.earlyLeaverPage),
                      child: const ItemDrawer(
                        imageIcon: AssetsManagement.lateComerIcon,
                        itemName: 'Early Leavers',
                      ),
                    ),
                    const SizedBox(height: 15),
                    const ItemDrawer(
                      imageIcon: AssetsManagement.leaveIcon,
                      itemName: 'Leaves',
                    ),
                    const SizedBox(height: 15),
                    const ItemDrawer(
                      imageIcon: AssetsManagement.issuesIcon,
                      itemName: 'Issues Reports',
                    ),
                    const SizedBox(height: 15),
                    const ItemDrawer(
                      imageIcon: AssetsManagement.incidentIcon,
                      itemName: 'Incident Reports',
                    ),
                    const SizedBox(height: 15),
                    const ItemDrawer(
                      imageIcon: AssetsManagement.employeeListIcon,
                      itemName: 'Employee List',
                    ),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () => context.pushNamed(RouteNamed.signInPage),
                      child: const ItemDrawer(
                        imageIcon: AssetsManagement.logoutIcon,
                        itemName: 'Log out',
                      ),
                    ),
                  ]))
            ],
          )),
    );
  }
}
