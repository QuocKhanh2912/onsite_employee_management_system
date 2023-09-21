import 'package:onsite_employee_management_system/data/user_modal.dart';

class AttendanceDataModal {
  int attendanceDataId;
  UserModal participant;
  String? inTime;
  String? outTime;

  AttendanceDataModal(
      {required this.attendanceDataId,
      required this.participant,
       this.inTime,
       this.outTime});
}
