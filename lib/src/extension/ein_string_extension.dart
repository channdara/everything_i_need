import 'ein_date_time_extension.dart';

extension EinStringExtension on String {
  DateTime? get toDateTime {
    if (isEmpty) return null;
    return DateTime.tryParse(this)?.toLocal();
  }

  DateTime? get toDateOnly => toDateTime?.dateOnly;

  bool get isNetworkUrl => startsWith('https://') || startsWith('http://');

  double get toDouble => double.tryParse(this) ?? 0.0;

  int get toInt => toDouble.toInt();

  bool isValidEmailAddress({bool strictValidation = false}) {
    if (isEmpty) return false;
    final source = strictValidation
        ? r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
        : r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    return RegExp(source).hasMatch(this);
  }

  String? toDateTimeAndFormat([String? newPattern, String? locale]) {
    if (isEmpty) return null;
    return toDateTime?.format(newPattern, locale);
  }
}
