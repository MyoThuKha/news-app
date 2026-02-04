import 'package:intl/intl.dart';

class DateFormatUtil {
  const DateFormatUtil._();

  static final _formatter = DateFormat('MMM dd, yyyy, HH:mm a');

  static DateTime? parseUtc(String? isoString) {
    if (isoString?.isEmpty ?? true) return null;

    return DateTime.parse(isoString!).toUtc();
  }

  static String toIsoUtc(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return dateTime.toUtc().toIso8601String();
  }

  static String toLocalReadable(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }

    return _formatter.format(dateTime.toLocal());
  }
}
