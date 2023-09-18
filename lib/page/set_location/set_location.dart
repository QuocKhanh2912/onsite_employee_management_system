import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/button/normal_button_custom.dart';
import 'package:onsite_employee_management_system/component/drawer/drawer.dart';
import 'package:onsite_employee_management_system/component/show_current_time/show_current_time.dart';
import 'package:onsite_employee_management_system/component/text_form_field/prefix_text_form_field_custom.dart';
import 'package:onsite_employee_management_system/page/landing/bloc/ci_co_bloc/ci_co_bloc.dart';
import 'package:onsite_employee_management_system/page/set_location/select_location_drop_down.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'bloc/set_location_bloc.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  TextEditingController selectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    selectController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetLocationBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsManagement.green,
        ),
        endDrawer: const DrawerCustom(),
        body: BlocListener<SetLocationBloc, SetLocationState>(
          listener: (context, state) {
            if (state is SaveLocationToLocalSuccess) {
              context.pushNamed(RouteNamed.homePage);
            }
          },
          child: SafeArea(
              child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 114,
                    ),
                    const ShowCurrentTime(),
                    const SizedBox(
                      height: 140,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AssetsManagement.positionIcon),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Location : Set Your Location',
                            style: TextStyleManagement.textNormalBlack22,
                          ),
                        ]),
                    const SizedBox(
                      height: 28,
                    ),
                    SelectLocationDropDown(
                        formKey: formKey,
                        selectLocationController: selectController),
                    const SizedBox(
                      height: 23,
                    ),
                    TextFormFieldCustom(
                        controller: descriptionController,
                        hintText: 'Description',
                        maxLine: 2,
                        requiredIcon: false),
                    const SizedBox(
                      height: 23,
                    ),
                    BlocBuilder<CiCoBloc, CiCoState>(
                      builder: (context, state) {
                        return BlocBuilder<SetLocationBloc, SetLocationState>(
                          builder: (context, state) {
                            return NormalButtonCustom(
                              colorOutlineButton: ColorsManagement.blurBlack,
                              colorBackGroundButton: Colors.green,
                              textNameStyle:
                                  TextStyleManagement.textNormalWhite19,
                              widthButton: double.infinity,
                              heightButton: 50,
                              buttonName: 'Submit',
                              onPress: () {
                                formKey.currentState!.validate();
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context.read<SetLocationBloc>().add(
                                      SaveLocationToLocal(
                                          locationName: selectController.text));
                                }
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
