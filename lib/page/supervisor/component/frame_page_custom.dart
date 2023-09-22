import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/component/drawer/supervisor_drawer.dart';
import 'package:onsite_employee_management_system/data/attendance_data_modal.dart';
import 'package:onsite_employee_management_system/data/early_leavers-modal.dart';
import 'package:onsite_employee_management_system/data/late_comer_modal.dart';
import 'package:onsite_employee_management_system/page/supervisor/component/select_date_drop_down_frame_page.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

import 'item_list_view_frame_page.dart';

class FramePageCustom extends StatefulWidget {
  const FramePageCustom(
      {super.key,
      this.listAttendances,
      this.listEarlyLeavers,
      this.listLateComers,
      required this.showUserId,
      required this.appBarName});

  final List<AttendanceDataModal>? listAttendances;
  final List<LateComerModal>? listLateComers;
  final List<EarlyLeaverModal>? listEarlyLeavers;
  final bool showUserId;
  final String appBarName;

  @override
  State<FramePageCustom> createState() => _FramePageCustomState();
}

class _FramePageCustomState extends State<FramePageCustom> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController selectDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarName,
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
            SelectDateDropDownFramePage(
              formKey: formKey,
              selectLocationController: selectDateController,
            ),
            Column(
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Total Employees: ',
                      style: TextStyleManagement.textNormalBlack20),
                  TextSpan(
                      text: widget.listAttendances != null
                          ? widget.listAttendances!.length.toString()
                          : widget.listLateComers != null
                              ? widget.listLateComers!.length.toString()
                              : widget.listEarlyLeavers!.length.toString(),
                      style: TextStyleManagement.textNormalGreen20),
                ])),
                const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'CSV',
                        style: TextStyleManagement.textUnderlineBlue13,
                      ),
                      SizedBox(
                        height: double.infinity,
                        child: VerticalDivider(
                            thickness: 1, color: ColorsManagement.blue),
                      ),
                      Text(
                        'PDF',
                        style: TextStyleManagement.textUnderlineBlue13,
                      ),
                    ],
                  ),
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
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.9,
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Name',
                  style: TextStyleManagement.textNormalBlack18,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.listAttendances != null ? 'In' : 'Time In',
                  style: TextStyleManagement.textNormalBlack18,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.listAttendances != null ? 'Out' : 'Late By',
                  style: TextStyleManagement.textNormalBlack18,
                ),
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
              itemBuilder: (context, index) => ItemListViewFramePage(
                    context: context,
                    index: index,
                    listAttendances: widget.listAttendances,
                    listEarlyLeavers: widget.listEarlyLeavers,
                    listLateComers: widget.listLateComers,
                    showUserId: widget.showUserId,
                  ),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: ColorsManagement.blurBlack,
                  ),
              itemCount: widget.listAttendances != null
                  ? widget.listAttendances!.length
                  : widget.listLateComers != null
                      ? widget.listLateComers!.length
                      : widget.listEarlyLeavers!.length),
        )
      ]),
    );
  }
}
