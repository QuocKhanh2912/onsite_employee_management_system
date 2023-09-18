import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/component/text_form_field/prefix_text_form_field_custom.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class DialogCustom {
  static Dialog dialogToChangeLocation(BuildContext context) {
    return Dialog(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
      backgroundColor: ColorsManagement.white,
      child: SizedBox(
        width: 300,
        height: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Do you want to change your location?',
                  style: TextStyleManagement.textNormalBlack20,
                  textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.pushNamed(RouteNamed.setLocationPage);
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 57,
                          color: ColorsManagement.green,
                          child: const Text(
                            'Yes',
                            style: TextStyleManagement.textBoldWhite19,
                          ))),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 57,
                          color: ColorsManagement.red,
                          child: const Text(
                            'No',
                            style: TextStyleManagement.textBoldWhite19,
                          ))),
                ],
              )
            ]),
      ),
    );
  }

  static Dialog dialogOutsideReason(
      BuildContext context, TextEditingController descriptionController) {
    return Dialog(
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero, borderSide: BorderSide.none),
      backgroundColor: ColorsManagement.white,
      child: SizedBox(
        width: 331,
        height: 463,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Why out of office range!',
                    style: TextStyleManagement.textNormalBlack20,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(AssetsManagement.warningDialogIcon),
                const SizedBox(
                  height: 37,
                ),
                TextFormFieldCustom(
                    maxLine: 2,
                    controller: descriptionController,
                    hintText: 'Description',
                    requiredIcon: false),
                const SizedBox(
                  height: 15,
                ),
                NormalButtonCustom(
                  heightButton: 36,
                  widthButton: 152,
                  buttonName: 'Submit',
                  colorBackGroundButton: ColorsManagement.green,
                  colorOutlineButton: ColorsManagement.blurBlack,
                  textNameStyle: TextStyleManagement.textNormalWhite16,
                  onPress: () {
                    context.pop();
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
