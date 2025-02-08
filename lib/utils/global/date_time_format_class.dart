import 'package:intl/intl.dart';
class DateTimeFormatClass{
  String formatDateTime(String dateTimeString, {String format = "MM-dd-yy HH:mm"}) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formatted = DateFormat(format).format(dateTime);
    return formatted;
  }
}