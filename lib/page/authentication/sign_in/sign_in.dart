import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/button/icon_button_custom.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/component/text_form_field/prefix_text_form_field_custom.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey keySignUp = GlobalKey();
  TextEditingController employeeNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    employeeNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.arrow_back))),
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: keySignUp,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 90),
                  const Text(
                    'Welcome Back!',
                    style: TextStyleManagement.textNormalBlack24,
                  ),
                  const SizedBox(height: 22),
                  Image.asset(AssetsManagement.welcomeBack),
                  const SizedBox(height: 26),
                  TextFormFieldCustom(
                      controller: employeeNameController,
                      hintText: 'Email',
                      maxLine: 1,
                      requiredIcon: true),
                  const SizedBox(height: 22),
                  TextFormFieldCustom(
                    controller: employeeNameController,
                    hintText: 'Password',
                    requiredIcon: true,
                    maxLine: 1,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyleManagement.textNormalGreen15,
                      ),
                    ],
                  ),
                  NormalButtonCustom(
                    widthButton: double.infinity,
                    heightButton: 50,
                    colorBackGroundButton: ColorsManagement.green,
                    colorOutlineButton: ColorsManagement.blurBlack,
                    buttonName: 'Sign in',
                    textNameStyle: TextStyleManagement.textNormalWhite19,
                    onPress: () {
                      context.pushNamed(RouteNamed.roleSelectionPage);
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyleManagement.textNormalBlack15),
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyleManagement.textNormalGreen15)
                        ])),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButtonCustom(
                    textNameStyle: TextStyleManagement.textNormalBlack19,
                    widthButton: double.infinity,
                    heightButton: 50,
                    buttonName: 'Continue With Google',
                    backGroundButton: ColorsManagement.white,
                    iconButton: AssetsManagement.googleLogo,
                    onPress: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
