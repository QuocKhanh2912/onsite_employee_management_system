import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/data/user_modal.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class EmployeeItemListView extends StatelessWidget {
  const EmployeeItemListView(
      {super.key, required this.listUser, required this.index});

  final int index;
  final List<UserModal> listUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
              width: 250,
              child: Text(
                listUser[index].userName,
                style: TextStyleManagement.textNormalBlack16,
              )),
          SizedBox(
              width: 100,
              child: InkWell(
                onTap: () => context.pushNamed(RouteNamed.employeeDetailPage,
                    extra: <String, UserModal>{'user': listUser[index]}),
                child: const Icon(
                  Icons.visibility_outlined,
                  size: 18,
                ),
              )),
        ],
      ),
    );
  }
}
