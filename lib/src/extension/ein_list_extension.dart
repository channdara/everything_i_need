import 'ein_map_extension.dart';

extension EinListExtension<E> on List<E?> {
  List<dynamic> removeNulls() {
    final result = <dynamic>[];
    forEach((item) {
      if (item is Map) {
        final cleaned = (item as Map).removeNulls();
        result.add(cleaned);
      } else if (item is List) {
        final cleanedList = (item as List).removeNulls();
        result.add(cleanedList);
      } else if (item != null) {
        result.add(item);
      }
    });
    return result;
  }
}
