import 'package:flutter/material.dart';
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
          child: Container(
            width: 71,
            height: 71,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorsManagement.green, width: 5)),
            child: Align(
                alignment: Alignment.center,
                child: Text('$percent%',
                    style: TextStyleManagement.textNormalBlack20)),
          ),
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
