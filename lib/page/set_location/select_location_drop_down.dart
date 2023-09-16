import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/location_modal.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class SelectLocationDropDown extends StatelessWidget {
  const SelectLocationDropDown(
      {super.key,
      required this.formKey,
      required this.selectLocationController});

  final GlobalKey formKey;
  final TextEditingController selectLocationController;

  @override
  Widget build(BuildContext context) {
    List<String> itemList = LocationModal.locationNameList;
    return Form(
      key: formKey,
      child: DropdownButtonFormField2<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            hintText: selectLocationController.text.isEmpty
                ? 'Select your site'
                : selectLocationController.text,
            hintStyle: TextStyleManagement.textBlurBlack19,),
        items: itemList
            .map((item) => DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: item,
                  child: Text(
                    item,
                    style: TextStyleManagement.textNormalBlack19,
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select location.';
          }
          return null;
        },
        onChanged: (value) {
          selectLocationController.text = value.toString();
        },
        onSaved: (value) {
          selectLocationController.text = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: IconStyleData(
          icon: Transform.rotate(
            angle: 90 * 3.1415926535 / 180,
            child: const Icon(
              Icons.code,
              color: Colors.black45,
            ),
          ),
          iconSize: 32,
        ),
      ),
    );
  }
}
