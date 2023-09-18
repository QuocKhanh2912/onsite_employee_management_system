import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
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
}
