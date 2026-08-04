import 'package:intl/intl.dart';

// ============================================================
// Date/time formatting helpers.
//
// `intl` provides DateFormat with locale-aware patterns. Centralizing the
// formats means every screen shows dates the same way, and we can change
// the format for the whole app in one place.
// ============================================================

abstract final class DateFormatter {
  const DateFormatter._();

  /// dd/MM/yyyy → e.g. "31/12/2024".
  static String format(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// dd MMM yyyy → e.g. "31 Dec 2024".
  static String fullDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  /// dd/MM/yyyy hh:mm a → e.g. "31/12/2024 09:30 PM".
  static String dateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy hh:mm a').format(date);
  }

  /// hh:mm a → e.g. "09:30 PM".
  static String time(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }
}
