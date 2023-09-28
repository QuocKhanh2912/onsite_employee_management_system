import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'calendar_table_custom.dart';
import 'note_custom.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee List',
              style: TextStyleManagement.textNormalWhite24),
          backgroundColor: ColorsManagement.green,
          foregroundColor: ColorsManagement.white,
          automaticallyImplyLeading: false,
        ),
        endDrawer: const SupervisorDrawerCustom(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'Attendance Log',
                style: TextStyleManagement.textBlurBlack24,
              ),
            ),
            Divider(
              thickness: 1,
              color: ColorsManagement.blurBlack,
            ),
            SizedBox(
              height: 8,
            ),
            NoteCustom(),
            Divider(
              thickness: 1,
              color: ColorsManagement.blurBlack,
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 20,
            ),
            CalendarTableCustom()
          ],
        ));
  }
}
