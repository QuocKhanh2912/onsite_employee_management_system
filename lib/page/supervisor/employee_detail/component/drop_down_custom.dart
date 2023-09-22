import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class DropDownCustom extends StatelessWidget {
  const DropDownCustom(
      {super.key,
      required this.formKey,
      required this.selectLocationController,
      required this.width,
      required this.hintText,
      required this.itemList,
      required this.onChange,
      required this.widthContent});

  final GlobalKey formKey;
  final TextEditingController selectLocationController;
  final List<String> itemList;
  final String hintText;
  final double width;
  final VoidCallback onChange;
  final double widthContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 34,
      child: Form(
        key: formKey,
        child: DropdownButtonFormField2<String>(
          iconStyleData: const IconStyleData(
              icon: Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: ColorsManagement.blurBlack,
              size: 24,
            ),
          )),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0.5, color: ColorsManagement.blurBlack),
                borderRadius: BorderRadius.circular(2)),
            hintText: selectLocationController.text,
            hintStyle: TextStyleManagement.textBlurBlack18,
          ),
          value: itemList[0],
          selectedItemBuilder: (context) {
            return itemList.map<Widget>((String item) {
              return SizedBox(
                width: widthContent,
                child: Text(
                  item,
                  style: TextStyleManagement.textBlurBlack18,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList();
          },
          items: itemList
              .map((item) => DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: item,
                    child: Text(
                      item,
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {}
            return null;
          },
          onChanged: (value) {
            onChange.call();
            selectLocationController.text = value.toString();
          },
          onSaved: (value) {
            selectLocationController.text = value.toString();
          },
        ),
      ),
    );
  }
}
