import 'package:flutter/material.dart';
import 'package:onsite_employee_management_system/utils/colors_management.dart';
import 'package:onsite_employee_management_system/utils/text_style_management.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTableCustom extends StatelessWidget {
  const CalendarTableCustom({super.key});


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 01, 01),
      focusedDay: DateTime.now(),
      lastDay: DateTime.utc(2050, 01, 01),
      calendarFormat: CalendarFormat.month,
      daysOfWeekHeight: 40,
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: const DaysOfWeekStyle(
          decoration: BoxDecoration(shape: BoxShape.rectangle),
          weekdayStyle: TextStyleManagement.textBoldBlack12,
          weekendStyle: TextStyleManagement.textBoldBlack12),
      weekendDays: const [DateTime.friday, DateTime.saturday],
      headerStyle: const HeaderStyle(titleCentered: true,
          headerPadding: EdgeInsets.only(bottom: 20),
          rightChevronPadding: EdgeInsets.zero,
          titleTextStyle: TextStyleManagement.textBoldBlack18,
          formatButtonVisible: false,
          headerMargin: EdgeInsets.symmetric(horizontal: 40),
          leftChevronVisible: true),
      calendarStyle: CalendarStyle(
          canMarkersOverflow: true,
          cellMargin: EdgeInsets.zero,
          tablePadding: const EdgeInsets.symmetric(horizontal: 40),
          cellPadding: EdgeInsets.zero,
          defaultTextStyle: TextStyleManagement.textNormalWhite12,
          weekendTextStyle: TextStyleManagement.textNormalWhite12,
          todayDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManagement.yellow,
              border: Border.all(color: ColorsManagement.white, width: 1)),
          defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManagement.green,
              border: Border.all(color: ColorsManagement.blurWhite, width: 1)),
          outsideDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManagement.white,
              border: Border.all(color: ColorsManagement.blurWhite, width: 1)),
          weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorsManagement.grey,
              border: Border.all(color: ColorsManagement.blurWhite, width: 1))),
    );
  }
}
