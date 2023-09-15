import 'package:flutter/material.dart';

class NormalButtonCustom extends StatelessWidget {
  const NormalButtonCustom(
      {super.key,
      required this.onPress,
      required this.colorBackGroundButton,
      required this.buttonName,
      required this.heightButton,
      required this.textNameStyle,
      required this.widthButton,
      required this.colorOutlineButton});

  final VoidCallback onPress;
  final String buttonName;
  final TextStyle textNameStyle;
  final Color colorBackGroundButton;
  final Color colorOutlineButton;
  final double heightButton;
  final double widthButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPress.call();
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: colorOutlineButton)),
            backgroundColor: MaterialStateProperty.all(colorBackGroundButton),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        child: SizedBox(
          height: heightButton,
          width: widthButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: textNameStyle,
              )
            ],
          ),
        ));
  }
}
