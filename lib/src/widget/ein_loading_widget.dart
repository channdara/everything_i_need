import 'package:flutter/material.dart';

import 'ein_wrapper_widget.dart';

class EinLoadingWidget extends StatelessWidget {
  const EinLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget.of(context)?.loadingWidget ?? const SizedBox();
  }
}
