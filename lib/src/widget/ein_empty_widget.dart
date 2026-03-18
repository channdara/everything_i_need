import 'package:flutter/material.dart';

import '../model/ein_empty_param.dart';
import 'ein_wrapper_widget.dart';

class EinEmptyWidget extends StatelessWidget {
  const EinEmptyWidget({super.key, required this.param});

  final EinEmptyParam param;

  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget.of(context)?.emptyWidget?.call(param) ??
        const SizedBox();
  }
}
