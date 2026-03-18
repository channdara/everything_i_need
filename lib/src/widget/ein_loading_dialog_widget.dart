import 'package:flutter/material.dart';

import 'ein_wrapper_widget.dart';

class EinLoadingDialogWidget extends StatelessWidget {
  const EinLoadingDialogWidget({super.key, required this.barrierDismissible});

  final bool barrierDismissible;

  @override
  Widget build(BuildContext context) {
    final chile =
        EinWrapperWidget.of(context)?.loadingWidget ??
        const CircularProgressIndicator.adaptive();
    return PopScope(
      canPop: barrierDismissible,
      child: Center(child: chile),
    );
  }
}
