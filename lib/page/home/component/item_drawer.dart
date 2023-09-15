import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer(
      {super.key, required this.imageIcon, required this.itemName});

  final String imageIcon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Image.asset(imageIcon),
          const SizedBox(
            width: 18,
          ),
          Text(
            itemName,
            style: TextStyleManagement.textNormalBlack21,
          )
        ],
      ),
    );
  }
}
