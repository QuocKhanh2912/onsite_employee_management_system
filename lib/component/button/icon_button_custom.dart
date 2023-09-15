import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';

class IconButtonCustom extends StatelessWidget {
  const IconButtonCustom(
      {super.key,
      required this.onPress,
      required this.backGroundButton,
      required this.buttonName,
      required this.heightButton,
      required this.textNameStyle,
      required this.widthButton,
      required this.iconButton});

  final VoidCallback onPress;
  final String buttonName;
  final TextStyle textNameStyle;
  final String iconButton;
  final Color backGroundButton;
  final double heightButton;
  final double widthButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPress.call();
        },
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                const BorderSide(width: 1, color: ColorsManagement.blurBlack)),
            shape: MaterialStateProperty.all(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(6))),
            backgroundColor: MaterialStateProperty.all(backGroundButton),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: SizedBox(
          height: heightButton,
          width: widthButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconButton),
              const SizedBox(
                width: 5,
              ),
              Text(
                buttonName,
                style: textNameStyle,
              )
            ],
          ),
        ));
  }
}
