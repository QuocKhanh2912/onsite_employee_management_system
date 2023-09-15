import 'package:intl/intl.dart';

class DateTimeManagement{
  static String getCurrentDay(){
    var currentTime = DateTime.now();
    return DateFormat("EEEE, MMM d" ).format(currentTime);
  }
  static String getCurrentTime(){
    var currentTime = DateTime.now();
    return DateFormat("h:mm a" ).format(currentTime);
  }
}