import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ShowCurrentTime extends StatelessWidget {
  const ShowCurrentTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateTimeManagement.getCurrentTime(),
          style: TextStyleManagement.textBoldBlack44,
        ),
        Text(
          DateTimeManagement.getTodayEEEEMMMd(),
          style: TextStyleManagement.textNormalBlack26,
        ),
      ],
    );
  }
}
