import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance',
          style: TextStyleManagement.textNormalWhite24,
        ),
        backgroundColor: ColorsManagement.green,
        foregroundColor: ColorsManagement.white,
        automaticallyImplyLeading: false,
      ),
      endDrawer: const SupervisorDrawerCustom(),
    );
  }
}
