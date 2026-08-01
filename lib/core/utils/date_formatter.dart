import 'package:intl/intl.dart';

abstract final class DateFormatter {
  const DateFormatter._();

  static String format(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String fullDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String dateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}
