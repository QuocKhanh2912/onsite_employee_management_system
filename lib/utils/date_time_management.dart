import 'package:intl/intl.dart';

class DateTimeManagement {
  static String getCurrentDay() {
    var currentTime = DateTime.now();
    return DateFormat("EEEE, MMM d").format(currentTime);
  }

  static String getCurrentTime() {
    var currentTime = DateTime.now();
    return DateFormat("h:mm a").format(currentTime);
  }

  static String calculateWorkingTime(
      {required String checkInTime, required String checkOutTime}) {
    final DateFormat format = DateFormat("h:mm a");
    final DateTime checkIn = format.parse(checkInTime);
    final DateTime checkOut = format.parse(checkOutTime);
    final Duration differenceTime = checkOut.difference(checkIn);
    final int differenceHour = differenceTime.inHours;
    final int differenceMinute = differenceTime.inMinutes;
    return '$differenceHour:$differenceMinute';
  }
}
