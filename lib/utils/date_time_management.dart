import 'package:intl/intl.dart';

class DateTimeManagement {
  static String getTodayEEEEMMMd() {
    var currentTime = DateTime.now();
    return DateFormat("EEEE, MMM d").format(currentTime);
  }

  static String getTodayDDMMMYYYY() {
    var currentTime = DateTime.now();
    return DateFormat("dd-MMM-yyyy").format(currentTime);
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

  static bool checkLate({required String time}) {
    if (time == '--:--' || time.isEmpty) {
      return false;
    }
    final inputFormat = DateFormat('h:mm a');
    final targetTime = inputFormat.parse('08:00 AM');
    final parsedTime = inputFormat.parse(time);
    return parsedTime.isAfter(targetTime);
  }

  static bool checkEarly({required String time}) {
    if (time == '--:--' || time.isEmpty) {
      return false;
    }
    final inputFormat = DateFormat('h:mm a');
    final targetTime = inputFormat.parse('5:00 PM');
    final inputTime = inputFormat.parse(time);
    return inputTime.isBefore(targetTime);
  }

  static bool checkTimeWorking({required String time}) {
    if (time == '--:--' || time.isEmpty) {
      return false;
    }
    final inputFormat = DateFormat('h:mm');
    final parsedTime = inputFormat.parse(time);
    final workingHours = parsedTime.hour;
    final workingMinutes = parsedTime.minute;
    return workingMinutes + workingHours * 60 < 480;
  }
  static String changeDataTimeFormat({required String time}){
    final dateTime = DateTime.parse(time).toLocal();
    final result = dateTime.toLocal();
    final timeFormat =DateFormat('hh:mm');
    return timeFormat.format(result);
  }
}
