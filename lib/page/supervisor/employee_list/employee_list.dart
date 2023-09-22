import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
import 'package:onsite_employee_management_system/data/user_modal.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'employee_item_listview.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List',
            style: TextStyleManagement.textNormalWhite24),
        backgroundColor: ColorsManagement.green,
        foregroundColor: ColorsManagement.white,
        automaticallyImplyLeading: false,
      ),
      endDrawer: const SupervisorDrawerCustom(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          RichText(
              text: TextSpan(children: [
            const TextSpan(
                text: 'Total Employees: ',
                style: TextStyleManagement.textNormalBlack20),
            TextSpan(
                text: UserModal.userMockData.length.toString(),
                style: TextStyleManagement.textNormalGreen20),
          ])),
          const SizedBox(height: 13),
          const Divider(
            thickness: 1,
            color: ColorsManagement.blurBlack,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                    width: 270,
                    child: Text(
                      'Name',
                      style: TextStyleManagement.textNormalBlack18,
                    )),
                SizedBox(
                    width: 100,
                    child: Text('Preview',
                        style: TextStyleManagement.textNormalBlack18)),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: ColorsManagement.blurBlack,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                thickness: 13,
                color: ColorsManagement.transparent,
              ),
              itemBuilder: (context, index) => EmployeeItemListView(
                  index: index, listUser: UserModal.userMockData),
              itemCount: UserModal.userMockData.length,
            ),
          )
        ],
      ),
    );
  }
}
