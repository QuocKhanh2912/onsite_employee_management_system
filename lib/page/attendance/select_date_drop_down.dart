import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/date_time_data/date_time_mock_data.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class SelectDateDropDown extends StatelessWidget {
  const SelectDateDropDown(
      {super.key,
      required this.formKey,
      required this.selectLocationController});

  final GlobalKey formKey;
  final TextEditingController selectLocationController;

  @override
  Widget build(BuildContext context) {
    List<String> itemList = DateTimeMockData.getDateListFromFirstDayToNow();
    return SizedBox(
      width: 173,
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
            contentPadding:  const EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0.5, color: ColorsManagement.blurBlack),
                borderRadius: BorderRadius.circular(2)),
            hintText: selectLocationController.text.isEmpty
                ? DateTimeManagement.getTodayDDMMMYYYY()
                : selectLocationController.text,
            hintStyle: TextStyleManagement.textBlurBlack18,
          ),
          selectedItemBuilder: (context) {
            return itemList.map<Widget>((String item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.zero, // Remove padding around content
                  child: Text(
                    item,
                    style: TextStyleManagement.textNormalBlack17,
                  ),
                ),
              );
            }).toList();
          },
          items: itemList
              .map((item) => DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: item,
                    child: Padding(
                      padding:  EdgeInsets.zero,
                      child: Text(
                        item,
                        style: TextStyleManagement.textBlurBlack18,
                      ),
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
        ),
      ),
    );
  }
}
