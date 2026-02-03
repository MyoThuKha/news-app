class DateFormatUtil {
  const DateFormatUtil._();

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
}
