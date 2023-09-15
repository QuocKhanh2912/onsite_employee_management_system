import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/page/home/drawer.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManagement.white,
      appBar: AppBar(
        backgroundColor: ColorsManagement.green,
      ),
      endDrawer: const DrawerCustom(),
      body: const SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Home Page',
            style: TextStyle(fontSize: 40),
          )
        ]),
      ),
    );
  }
}
