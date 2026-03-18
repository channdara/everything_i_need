import 'ein_list_extension.dart';

extension EinMapExtension<K, V> on Map<K, V?> {
  Map<K, dynamic> removeNulls() {
    final result = <K, dynamic>{};
    forEach((key, value) {
      if (value is Map) {
        final cleaned = (value as Map).removeNulls();
        result[key] = cleaned;
      } else if (value is List) {
        final cleanedList = value.removeNulls();
        result[key] = cleanedList;
      } else if (value != null) {
        result[key] = value;
      }
    });
    return result;
  }
}
