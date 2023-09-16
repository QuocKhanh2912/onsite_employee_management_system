import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixImage,
      required this.maxLine});

  final TextEditingController controller;
  final String? prefixImage;
  final String hintText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50 * maxLine.toDouble(),
      child: TextFormField(
        controller: controller,
        style: TextStyleManagement.textNormalBlack19,
        decoration: InputDecoration(
          prefixIcon: prefixImage == null
              ? null
              : Image.asset(
                  prefixImage!,
                ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          hintText: hintText,
          hintStyle: TextStyleManagement.textBlurBlack19,
        ),
      ),
    );
  }
}
