import 'package:flutter/material.dart';

import '../model/ein_error_param.dart';
import 'ein_wrapper_widget.dart';

class EinErrorDialogWidget extends StatelessWidget {
  const EinErrorDialogWidget({
    super.key,
    required this.param,
    required this.barrierDismissible,
  });

  final EinErrorParam param;
  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    final child =
        EinWrapperWidget.of(context)?.errorDialogWidget?.call(param) ??
        const SizedBox();
    return PopScope(canPop: barrierDismissible, child: child);
  }
}
