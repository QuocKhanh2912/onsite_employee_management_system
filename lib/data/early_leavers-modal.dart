import 'package:onsite_employee_management_system/data/user_modal.dart';

class EarlyLeaverModal {
  UserModal earlyLeaver;
  String timeIn;
  String lateBy;

  EarlyLeaverModal(
      {required this.earlyLeaver, required this.timeIn, required this.lateBy});
}
