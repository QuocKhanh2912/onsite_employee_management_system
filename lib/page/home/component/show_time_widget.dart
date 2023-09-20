import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ShowTimeWidget extends StatelessWidget {
  const ShowTimeWidget(
      {super.key,
      required this.imageClock,
      required this.time,
      required this.typeTime,
      required this.checkTime,
      required this.checkLate});

  final String imageClock;
  final String time;
  final String typeTime;
  final bool checkTime;
  final bool checkLate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageClock),
        const SizedBox(
          height: 16,
        ),
        Text(
          time,
          style: checkTime
              ? (checkLate
                  ? (DateTimeManagement.checkLate(time: time)
                      ? TextStyleManagement.textBoldRed21
                      : TextStyleManagement.textBoldBlack21)
                  : DateTimeManagement.checkEarly(time: time)
                      ? TextStyleManagement.textBoldRed21
                      : TextStyleManagement.textBoldBlack21)
              : DateTimeManagement.checkTimeWorking(time: time)
                  ? TextStyleManagement.textBoldRed21
                  : TextStyleManagement.textBoldBlack21,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          typeTime,
          style: TextStyleManagement.textNormalBlack17,
        ),
      ],
    );
  }
}
