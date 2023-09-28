import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';

import 'item_not_custom.dart';

class NoteCustom extends StatelessWidget {
  const NoteCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: 78,
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.green,
                    noteName: 'Present',
                  )),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                  width: 78,
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.blurRed,
                    noteName: 'Absent',
                  )),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                  width: 78,
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.blue,
                    noteName: 'Leave',
                  )),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.blurGray,
                    noteName: 'Week Off',
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                  width: 78,
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.pink,
                    noteName: 'Late ',
                  )),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                  width: 78,
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.purple,
                    noteName: 'Early',
                  )),
              SizedBox(
                width: 15,
              ),
              SizedBox(
                  height: 26,
                  child: ItemNoteCustom(
                    dotColor: ColorsManagement.darkRed,
                    noteName: 'Late & Early',
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
