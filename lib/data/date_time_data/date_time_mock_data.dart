import 'package:intl/intl.dart';

class DateTimeMockData {
  static List<String> getDateListFromFirstDayToNow() {
    final now = DateTime.now();
    var firstDayOfMonth = DateTime(now.year, now.month, 1);
    final DateFormat formatter = DateFormat('dd-MMM-yyyy');
    final List<String> dateList = [];

    while (firstDayOfMonth.isBefore(now) || firstDayOfMonth.isAtSameMomentAs(now)) {
      final formattedDate = formatter.format(firstDayOfMonth);
      dateList.add(formattedDate);
      firstDayOfMonth = firstDayOfMonth.add(const Duration(days: 1));
    }
    return dateList;
  }
}