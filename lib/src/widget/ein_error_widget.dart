import 'package:flutter/material.dart';

import '../model/ein_error_param.dart';
import 'ein_wrapper_widget.dart';

class EinErrorWidget extends StatelessWidget {
  const EinErrorWidget({super.key, required this.param});

  final EinErrorParam param;

  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget.of(context)?.errorWidget?.call(param) ??
        const SizedBox();
  }
}
