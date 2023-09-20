  import 'package:flutter/material.dart';
  import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
  import 'package:onsite_employee_management_system/data/ci_co_per_date_modal.dart';
  import 'package:onsite_employee_management_system/page/attendance/select_date_drop_down.dart';
  import 'package:onsite_employee_management_system/utils/colors_management.dart';
  import 'package:onsite_employee_management_system/utils/text_style_management.dart';

  import 'ItemListView.dart';

  class AttendancePage extends StatefulWidget {
    const AttendancePage({super.key});

    @override
    State<AttendancePage> createState() => _AttendancePageState();
  }

  class _AttendancePageState extends State<AttendancePage> {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController selectDateController = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Attendance',
            style: TextStyleManagement.textNormalWhite24,
          ),
          backgroundColor: ColorsManagement.green,
          foregroundColor: ColorsManagement.white,
          automaticallyImplyLeading: false,
        ),
        endDrawer: const SupervisorDrawerCustom(),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SelectDateDropDown(
                formKey: formKey,
                selectLocationController: selectDateController,
              ),
              Column(
                children: [
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: 'Total Employees: ',
                        style: TextStyleManagement.textNormalBlack20),
                    TextSpan(
                        text: '25', style: TextStyleManagement.textNormalGreen20),
                  ])),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'CSV',
                        style: TextStyleManagement.textUnderlineBlue13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: VerticalDivider(
                            thickness: 1, color: ColorsManagement.black),
                      ),
                      Text(
                        'PDF',
                        style: TextStyleManagement.textUnderlineBlue13,
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          const Divider(
            thickness: 1,
            color: ColorsManagement.blurBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 17, right: MediaQuery.sizeOf(context).width / 2.5),
                child: const Text(
                  'Name',
                  style: TextStyleManagement.textNormalBlack18,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: MediaQuery.sizeOf(context).width / 5),
                child: const Text(
                  'In',
                  style: TextStyleManagement.textNormalBlack18,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(),
                child: Text(
                  'Out',
                  style: TextStyleManagement.textNormalBlack18,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: ColorsManagement.blurBlack,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ItemAttendance(
                    context: context,
                    index: index,
                    listAttendances:
                        CiCoPerDateModal.sep202003.participants ?? []),
                separatorBuilder: (context, index) => const Divider(
                      thickness: 1,
                      color: ColorsManagement.blurBlack,
                    ),
                itemCount: CiCoPerDateModal.sep202003.participants?.length ?? 0),
          )
        ]),
      );
    }
  }
