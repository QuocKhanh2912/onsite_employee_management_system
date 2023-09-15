import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/page/home/component/item_drawer.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

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
                      Image.asset(AssetsManagement.defaultAvatar),
                      const SizedBox(height: 9),
                      const Text(
                        'Hi! Kabir',
                        style: TextStyleManagement.textNormalWhite21,
                      )
                    ]),
              ),
              const Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: 31),
                    ItemDrawer(
                      imageIcon: AssetsManagement.homeIcon,
                      itemName: 'Home',
                    ),
                    SizedBox(height: 15),
                    ItemDrawer(
                      imageIcon: AssetsManagement.issuesIcon,
                      itemName: 'Issues',
                    ),
                    SizedBox(height: 15),
                    ItemDrawer(
                      imageIcon: AssetsManagement.incidentIcon,
                      itemName: 'Incident',
                    ),
                    SizedBox(height: 15),
                    ItemDrawer(
                      imageIcon: AssetsManagement.leaveIcon,
                      itemName: 'Leave',
                    ),
                    SizedBox(height: 15),
                    ItemDrawer(
                      imageIcon: AssetsManagement.changePasswordIcon,
                      itemName: 'Change Password',
                    ),
                    SizedBox(height: 15),
                    ItemDrawer(
                      imageIcon: AssetsManagement.logoutIcon,
                      itemName: 'Logout',
                    ),
                    SizedBox(height: 15),
                  ]))
            ],
          )),
    );
  }
}
