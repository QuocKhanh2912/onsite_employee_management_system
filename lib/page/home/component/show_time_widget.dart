import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ShowTimeWidget extends StatelessWidget {
  const ShowTimeWidget(
      {super.key, required this.imageClock, required this.time, required this.typeTime});

  final String imageClock;
  final String time;
  final String typeTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageClock),
        const SizedBox(
          height: 16,
        ),
        Text(time,style: TextStyleManagement.textBoldBlack21,),
        const SizedBox(
          height: 16,
        ),
        Text(typeTime,style: TextStyleManagement.textNormalBlack17,),

        
      ],
    );
  }
}
