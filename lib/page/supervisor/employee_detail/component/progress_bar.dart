import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ProgressBarCustom extends StatelessWidget {
  const ProgressBarCustom({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
        size: 61,
        mergeMode: true,
        progressColors:
            percent >= 10 ? [ColorsManagement.red] : [ColorsManagement.green],
        backColor: Colors.transparent,
        progressStrokeWidth: 5,
        valueNotifier: ValueNotifier(percent),
        onGetText: (percent) {
          return Text(
            '${percent.toInt()}%',
            style: TextStyleManagement.textBlurBlack20,
          );
        });
  }
}
