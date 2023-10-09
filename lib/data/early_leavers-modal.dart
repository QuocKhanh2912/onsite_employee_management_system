import 'package:onsite_employee_management_system/data/mock_data_user_modal.dart';

class EarlyLeaverModal {
  MockDataUserModal earlyLeaver;
  String? timeIn;
  String? lateBy;

  EarlyLeaverModal({required this.earlyLeaver, this.timeIn, this.lateBy});
}
