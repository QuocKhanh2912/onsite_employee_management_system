import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/ci_co_per_date_modal.dart';
import 'package:onsite_employee_management_system/page/supervisor/component/frame_page_custom.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return FramePageCustom(
      showUserId: true,
      appBarName: 'Attendance',
      listAttendances: CiCoPerDateModal.sep202003.participants,
    );
  }
}
