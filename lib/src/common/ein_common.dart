import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

void logDebug(List<dynamic> content) {
  if (kDebugMode) {
    print('👉 LogDebug: ${content.join(' | ')}');
  }
}
