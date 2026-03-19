import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'ein_media_query.dart';

void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

void logDebug(List<dynamic> content) {
  if (kDebugMode) print('👉 LogDebug: ${content.join(' | ')}');
}

void disposeEin() {
  EinMediaQuery.dispose();
}
