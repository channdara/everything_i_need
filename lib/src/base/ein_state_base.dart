import 'package:flutter/material.dart';

abstract class EinStateBase<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
    initStateFuture();
    WidgetsBinding.instance.addPostFrameCallback(initStatePostFrameCallback);
  }

  void initStatePostFrameCallback(Duration duration) {}

  Future<void> initStateFuture() async {}
}
