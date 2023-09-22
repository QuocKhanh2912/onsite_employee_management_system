import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class LeaveRequestCustom extends StatelessWidget {
  const LeaveRequestCustom(
      {super.key, required this.nameRequest, required this.dayOfNumber});

  final String nameRequest;
  final int dayOfNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nameRequest,
          style: TextStyleManagement.textNormalBlack18,
        ),
        Container(
          height: 28,
          width: 114,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: ColorsManagement.blurBlack, width: 1)),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                '$dayOfNumber days',
                style: TextStyleManagement.textBlurBlack16,
              )),
        )
      ],
    );
  }
}
