import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/button/icon_button_custom.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/component/text_form_field/prefix_text_form_field_custom.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
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
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      'Sing Up for Better Experience',
                      style: TextStyleManagement.textNormalBlack24,
                    ),
                    const SizedBox(height: 35),
                    TextFormFieldCustom(
                      controller: employeeNameController,
                      hintText: 'Employee Name',
                      prefixImage: AssetsManagement.employeeNameIcon,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 22),
                    TextFormFieldCustom(
                      controller: employeeNameController,
                      hintText: 'Email',
                      prefixImage: AssetsManagement.emailIcon,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 22),
                    TextFormFieldCustom(
                      controller: employeeNameController,
                      hintText: 'Password',
                      prefixImage: AssetsManagement.passwordIcon,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 22),
                    NormalButtonCustom(
                      widthButton: double.infinity,
                      heightButton: 50,
                      colorBackGroundButton: ColorsManagement.green,
                      colorOutlineButton: ColorsManagement.blurBlack,
                      buttonName: 'Sign Up',
                      textNameStyle: TextStyleManagement.textNormalWhite19,
                      onPress: () {
                        context.goNamed(RouteNamed.profilePage);
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyleManagement.textNormalBlack15),
                          TextSpan(
                              text: 'Sign In',
                              style: TextStyleManagement.textNormalGreen15)
                        ])),
                      ],
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
        ),
      )),
    );
  }
}
