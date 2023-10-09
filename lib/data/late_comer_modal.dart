import 'package:onsite_employee_management_system/data/mock_data_user_modal.dart';

class LateComerModal {
  MockDataUserModal lateComer;
  String? timeIn;
  String? lateBy;

  LateComerModal({required this.lateComer, this.timeIn, this.lateBy});
}
