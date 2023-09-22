import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
import 'package:onsite_employee_management_system/data/item_list_drop_down.dart';
import 'package:onsite_employee_management_system/data/user_modal.dart';
import 'package:onsite_employee_management_system/page/supervisor/employee_detail/component/chart_custom.dart';
import 'package:onsite_employee_management_system/utils/assets_management.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'component/drop_down_custom.dart';
import 'component/leave_request_custom.dart';

class EmployeeDetailPage extends StatefulWidget {
  const EmployeeDetailPage({super.key});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

GlobalKey<FormState> selectDateFormKey = GlobalKey<FormState>();
GlobalKey<FormState> selectLeaveRequestFormKey = GlobalKey<FormState>();
TextEditingController selectDateController = TextEditingController();
TextEditingController selectLeaveRequestController = TextEditingController();

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  @override
  void initState() {
    setState(() {
      selectLeaveRequestController.text =
          ItemListDropDownManagement.listLeaveRequests[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(158.0),
        child: AppBar(
          backgroundColor: ColorsManagement.green,
          foregroundColor: ColorsManagement.white,
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () => context.pop, child: const Icon(Icons.arrow_back)),
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                AssetsManagement.employeeDetailIcon,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Employ Id: ${UserModal.mobussharIslam.userId}',
                style: TextStyleManagement.textNormalWhite16,
              ),
              Text(UserModal.mobussharIslam.userName,
                  style: TextStyleManagement.textNormalWhite18)
            ],
          ),
          centerTitle: true,
        ),
      ),
      endDrawer: const SupervisorDrawerCustom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Personal Statistics',
                  style: TextStyleManagement.textBoldBlack20,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropDownCustom(
                      width: 180,
                      hintText: 'Last 14 days',
                      selectLocationController: selectDateController,
                      formKey: selectDateFormKey,
                      itemList: ItemListDropDownManagement.listDates,
                      widthContent: 110,
                      onChange: () {},
                    ),
                    Image.asset(AssetsManagement.calendarIcon)
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChartCustom(percent: 10, title: 'Late'),
                      SizedBox(
                        width: 31,
                      ),
                      ChartCustom(percent: 5, title: 'Absent'),
                      SizedBox(
                        width: 31,
                      ),
                      ChartCustom(percent: 5, title: 'Leaves'),
                    ]),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Leave Requests',
                  style: TextStyleManagement.textNormalBlack20,
                ),
                const SizedBox(
                  height: 5,
                ),
                DropDownCustom(
                  width: MediaQuery.sizeOf(context).width,
                  hintText: 'Tap to view leave requests',
                  selectLocationController: selectLeaveRequestController,
                  formKey: selectLeaveRequestFormKey,
                  itemList: ItemListDropDownManagement.listLeaveRequests,
                  widthContent: MediaQuery.sizeOf(context).width - 120,
                  onChange: () {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                selectLeaveRequestController.text ==
                        ItemListDropDownManagement.listLeaveRequests[0]
                    ? const Column(
                        children: [
                          LeaveRequestCustom(
                            dayOfNumber: 12,
                            nameRequest: 'Total Presents',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LeaveRequestCustom(
                            dayOfNumber: 2,
                            nameRequest: 'Late',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LeaveRequestCustom(
                            dayOfNumber: 2,
                            nameRequest: 'Early Leaves',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LeaveRequestCustom(
                            dayOfNumber: 1,
                            nameRequest: 'Absent',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LeaveRequestCustom(
                            dayOfNumber: 1,
                            nameRequest: 'Leaves',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : selectLeaveRequestController.text == 'Total Presents'
                        ? const LeaveRequestCustom(
                            dayOfNumber: 12,
                            nameRequest: 'Total Presents',
                          )
                        : selectLeaveRequestController.text == 'Late'
                            ? const LeaveRequestCustom(
                                dayOfNumber: 2,
                                nameRequest: 'Late',
                              )
                            : selectLeaveRequestController.text == 'Late'
                                ? const LeaveRequestCustom(
                                    dayOfNumber: 2,
                                    nameRequest: 'Early Leaves',
                                  )
                                : selectLeaveRequestController.text == 'Absent'
                                    ? const LeaveRequestCustom(
                                        dayOfNumber: 1,
                                        nameRequest: 'Absent',
                                      )
                                    : const LeaveRequestCustom(
                                        dayOfNumber: 1,
                                        nameRequest: 'Leaves',
                                      ),
              ]),
        ),
      ),
    );
  }
}
