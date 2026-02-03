class DateFormatUtil {
  static DateTime? parseUtc(String isoString) {
    if (isoString.isEmpty) return null;

    return DateTime.parse(isoString).toUtc();
  }

  static String toIsoUtc(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return dateTime.toUtc().toIso8601String();
  }
}
