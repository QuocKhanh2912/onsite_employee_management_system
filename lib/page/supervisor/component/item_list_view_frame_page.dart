import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/data/attendance_data_modal.dart';
import 'package:onsite_employee_management_system/data/early_leavers-modal.dart';
import 'package:onsite_employee_management_system/data/late_comer_modal.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/date_time_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';

class ItemListViewFramePage extends StatelessWidget {
  const ItemListViewFramePage(
      {super.key,
      required this.context,
      required this.index,
      this.listAttendances,
      this.listEarlyLeavers,
      this.listLateComers,
      required this.showUserId});

  final int index;
  final BuildContext context;
  final List<AttendanceDataModal>? listAttendances;
  final List<LateComerModal>? listLateComers;
  final List<EarlyLeaverModal>? listEarlyLeavers;
  final bool showUserId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  listAttendances != null
                      ? listAttendances![index].participant.userName
                      : listLateComers != null
                          ? listLateComers![index].lateComer.userName
                          : listEarlyLeavers![index].earlyLeaver.userName,
                  style: TextStyleManagement.textNormalBlack16,
                ),
                const SizedBox(height: 5),
                showUserId
                    ? Text(
                        listAttendances != null
                            ? listAttendances![index]
                                .participant
                                .userId
                                .toString()
                            : listLateComers != null
                                ? listLateComers![index]
                                    .lateComer
                                    .userId
                                    .toString()
                                : listEarlyLeavers![index]
                                    .earlyLeaver
                                    .userId
                                    .toString(),
                        style: TextStyleManagement.textBlurBlack14,
                      )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Text(
                  listAttendances != null
                      ? listAttendances![index].participant.role
                      : listLateComers != null
                          ? listLateComers![index].lateComer.role
                          : listEarlyLeavers![index].earlyLeaver.role,
                  style: TextStyleManagement.textBlurBlack14,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        Container(
          width: 1,
          height: 56,
          color: ColorsManagement.blurBlack,
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 2.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 85,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    listAttendances != null
                        ? listAttendances![index].inTime ?? '--:--'
                        : listLateComers != null
                            ? listLateComers![index].timeIn ?? '--:--'
                            : listEarlyLeavers![index].timeIn ?? '--:--',
                    style: listAttendances != null
                        ? (DateTimeManagement.checkEarly(
                                time: listAttendances![index].inTime ?? '--:--')
                            ? TextStyleManagement.textNormalRed16
                            : TextStyleManagement.textNormalBlack16)
                        : TextStyleManagement.textNormalBlack16,
                  ),
                ),
              ),
              SizedBox(
                width: 85,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    listAttendances != null
                        ? listAttendances![index].outTime ?? '--:--'
                        : listLateComers != null
                            ? listLateComers![index].lateBy ?? '--:--'
                            : listEarlyLeavers![index].lateBy ?? '--:--',
                    style: listAttendances != null
                        ? (DateTimeManagement.checkEarly(
                                time:
                                    listAttendances![index].outTime ?? '--:--')
                            ? TextStyleManagement.textNormalRed16
                            : TextStyleManagement.textNormalBlack16)
                        : TextStyleManagement.textNormalBlack16,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
