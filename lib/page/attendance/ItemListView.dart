import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/attendance_data_modal.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ItemAttendance extends StatelessWidget {
  const ItemAttendance(
      {super.key,
      required this.context,
      required this.index,
      required this.listAttendances});

  final int index;
  final BuildContext context;
  final List<AttendanceDataModal> listAttendances;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  listAttendances[index].participant.userName,
                  style: TextStyleManagement.textNormalBlack16,
                ),
                const SizedBox(height: 5),
                Text(
                  listAttendances[index].participant.userId.toString(),
                  style: TextStyleManagement.textBlurBlack14,
                ),
                const SizedBox(height: 5),
                Text(
                  listAttendances[index].participant.role,
                  style: TextStyleManagement.textBlurBlack14,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        Container(
          width: 1,
          height: 56,
          color: ColorsManagement.blurBlack,
        ),
        const SizedBox(width: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listAttendances[index].inTime,
              style: DateTimeManagement.checkLate(
                      time: listAttendances[index].inTime)
                  ? TextStyleManagement.textNormalRed16
                  : TextStyleManagement.textNormalBlack16,
            ),
            const SizedBox(width: 10),
            Text(
              listAttendances[index].outTime,
              style: DateTimeManagement.checkEarly(
                  time: listAttendances[index].outTime)
                  ? TextStyleManagement.textNormalBlack16
                  : TextStyleManagement.textNormalRed16,
            ),
          ],
        )
      ],
    );
  }
}
