import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension EinContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(StatefulWidget screen) async {
    return Navigator.of(this).push<T>(_route<T>(screen));
  }

  Future<T?> pushReplaceOne<T extends Object?, TO extends Object?>(
    StatefulWidget screen, {
    TO? result,
  }) async {
    return Navigator.of(this).pushReplacement<T, TO>(_route<T>(screen));
  }

  Future<T?> pushReplaceAll<T extends Object?, TO extends Object?>(
    StatefulWidget screen, {
    TO? result,
  }) async {
    Navigator.of(this).popUntil((route) => route.isFirst);
    return pushReplaceOne(screen, result: result);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  Route<T> _route<T>(StatefulWidget screen) {
    return Platform.isIOS
        ? CupertinoPageRoute<T>(builder: (context) => screen)
        : MaterialPageRoute<T>(builder: (context) => screen);
  }
}
