import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class AuthenticationOptionPage extends StatefulWidget {
  const AuthenticationOptionPage({super.key});

  @override
  State<AuthenticationOptionPage> createState() =>
      _AuthenticationOptionPageState();
}

class _AuthenticationOptionPageState extends State<AuthenticationOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsManagement.mediumLogo),
              NormalButtonCustom(
                colorBackGroundButton: ColorsManagement.green,
                colorOutlineButton: ColorsManagement.transparent,
                buttonName: 'Sign In',
                heightButton: 50,
                widthButton: double.infinity,
                textNameStyle: TextStyleManagement.textNormalWhite19,
                onPress: () {
                  context.pushNamed(RouteNamed.signInPage);
                },
              ),
              const SizedBox(height: 15),
              NormalButtonCustom(
                widthButton: double.infinity,
                heightButton: 50,
                colorBackGroundButton: ColorsManagement.white,
                colorOutlineButton: ColorsManagement.blurBlack,
                buttonName: 'Sign Up',
                textNameStyle: TextStyleManagement.textNormalGreen19,
                onPress: () {
                  context.pushNamed(RouteNamed.signUpPage);
                },
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyleManagement.textNormalBlack15,
                    ),
                  )
                ],
              ),
            ]),
      ),
    ));
  }
}
