import 'dart:convert';

abstract class EinBaseSerializer<T> {
  T fromJson(dynamic data);

  T? fromJsonOrNull(dynamic data) {
    try {
      return fromJson(data);
    } catch (_) {
      return null;
    }
  }

  List<T> fromJsonList(dynamic data) {
    try {
      return (data as List<dynamic>)
          .map((element) => fromJsonOrNull(element))
          .whereType<T>()
          .toList();
    } catch (_) {
      return [];
    }
  }

  List<T>? fromJsonListOrNull(dynamic data) {
    try {
      return (data as List<dynamic>?)
          ?.map((element) => fromJsonOrNull(element))
          .whereType<T>()
          .toList();
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> toMap(T? model) => {};

  String toJsonString(T? model) =>
      toMap(model).isEmpty ? '' : jsonEncode(toMap(model));
}
