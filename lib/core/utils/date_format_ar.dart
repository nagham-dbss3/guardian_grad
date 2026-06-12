import 'package:intl/intl.dart';

/// Arabic-friendly date/time helpers. Uses the 'ar' locale (initialized in
/// main via intl default locale) and gentle relative phrasing.
class DateFormatAr {
  DateFormatAr._();

  static const List<String> _months = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  static const List<String> _weekdays = [
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];

  /// e.g. "12 يونيو 2026"
  static String date(DateTime d) => '${d.day} ${_months[d.month - 1]} ${d.year}';

  /// e.g. "الخميس 12 يونيو"
  static String dayDate(DateTime d) =>
      '${_weekdays[d.weekday - 1]} ${d.day} ${_months[d.month - 1]}';

  /// 24h time, e.g. "09:30"
  static String time(DateTime d) => DateFormat('HH:mm').format(d);

  /// "الخميس 12 يونيو · 09:30"
  static String dayDateTime(DateTime d) => '${dayDate(d)} · ${time(d)}';

  /// Gentle relative day phrase for reminders.
  /// Returns e.g. "اليوم", "غدًا", "بعد ٣ أيام", or a date.
  static String relativeDay(DateTime d, {DateTime? now}) {
    final today = _dateOnly(now ?? _nowLocal());
    final target = _dateOnly(d);
    final diff = target.difference(today).inDays;
    if (diff == 0) return 'اليوم';
    if (diff == 1) return 'غدًا';
    if (diff == -1) return 'أمس';
    if (diff > 1 && diff <= 7) return 'بعد $diff أيام';
    if (diff < -1 && diff >= -7) return 'قبل ${-diff} أيام';
    return date(d);
  }

  static DateTime _dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  // Indirect now() so the rest of the app has a single seam for testing.
  static DateTime _nowLocal() => DateTime.now();
}
