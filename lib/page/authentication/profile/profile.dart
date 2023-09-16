import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/component/text_form_field/prefix_text_form_field_custom.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  TextEditingController supervisedByController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    designationController.dispose();
    departmentController.dispose();
    teamNameController.dispose();
    supervisedByController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(AssetsManagement.profileLogo),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'Update profile',
                    style: TextStyleManagement.textNormalBlack26,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  TextFormFieldCustom(
                      hintText: 'Designation',
                      controller: designationController,
                      maxLine: 1),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormFieldCustom(
                      hintText: 'Department',
                      controller: departmentController,
                      maxLine: 1),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormFieldCustom(
                      hintText: 'Team Name',
                      controller: teamNameController,
                      maxLine: 1),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormFieldCustom(
                      hintText: 'Supervised By',
                      controller: supervisedByController,
                      maxLine: 1),
                  const SizedBox(
                    height: 22,
                  ),
                  TextFormFieldCustom(
                      hintText: 'Designation',
                      controller: designationController,
                      maxLine: 1),
                  const SizedBox(
                    height: 22,
                  ),
                  NormalButtonCustom(
                    buttonName: 'Update',
                    heightButton: 50,
                    widthButton: double.infinity,
                    textNameStyle: TextStyleManagement.textNormalWhite19,
                    colorBackGroundButton: ColorsManagement.green,
                    colorOutlineButton: ColorsManagement.blurBlack,
                    onPress: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
