import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/page/supervisor/employee_detail/component/progress_bar.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ChartCustom extends StatelessWidget {
  const ChartCustom({super.key, required this.title, required this.percent});

  final int percent;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          width: 76,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManagement.blurBlack, width: 5)),
          child: ProgressBarCustom(percent: percent.toDouble()),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          title,
          style: TextStyleManagement.textNormalBlack18,
        )
      ],
    );
  }
}
