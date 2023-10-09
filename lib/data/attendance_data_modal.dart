import 'package:onsite_employee_management_system/data/mock_data_user_modal.dart';

class AttendanceDataModal {
  int attendanceDataId;
  MockDataUserModal participant;
  String? inTime;
  String? outTime;

  AttendanceDataModal(
      {required this.attendanceDataId,
      required this.participant,
       this.inTime,
       this.outTime});
}
