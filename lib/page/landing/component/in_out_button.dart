import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class InOutButton extends StatelessWidget {
  const InOutButton(
      {super.key,
      required this.imageIcon,
      required this.name,
      required this.backGroundColor});

  final Color backGroundColor;
  final String imageIcon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 151,
          height: 152,
          decoration: BoxDecoration(
              color: backGroundColor, borderRadius: BorderRadius.circular(5)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset(imageIcon),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100, left: 60),
          child: Text(name, style: TextStyleManagement.textBoldWhite24),
        ),
      ],
    );
  }
}
