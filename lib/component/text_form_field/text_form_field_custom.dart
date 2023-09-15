import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.prefixImage});

  final TextEditingController controller;
  final String prefixImage;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        style: TextStyleManagement.textNormalBlack19,
        decoration: InputDecoration(
          prefixIcon: Image.asset(
            prefixImage,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
          hintStyle: TextStyleManagement.textBlurBlack19,
        ),
      ),
    );
  }
}
