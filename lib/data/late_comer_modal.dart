import 'package:onsite_employee_management_system/data/user_modal.dart';

class LateComerModal {
  UserModal lateComer;
  String? timeIn;
  String? lateBy;

  LateComerModal({required this.lateComer, this.timeIn, this.lateBy});
}
