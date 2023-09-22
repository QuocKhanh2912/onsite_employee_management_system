import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ItemNoteCustom extends StatelessWidget {
  const ItemNoteCustom(
      {super.key, required this.dotColor, required this.noteName});

  final Color dotColor;
  final String noteName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 11,
          height: 11,
          decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          noteName,
          style: TextStyleManagement.textNormalBlack14,
        )
      ],
    );
  }
}
