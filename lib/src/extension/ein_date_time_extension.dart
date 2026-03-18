import 'package:intl/intl.dart';

extension EinDateTimeExtension on DateTime {
  DateTime? get dateOnly => DateTime(year, month, day);

  String? format([String? newPattern, String? locale]) =>
      DateFormat(newPattern, locale).format(this);
}
