import 'package:flutter/widgets.dart';

extension EinScrollControllerExtension on ScrollController {
  void animateListToTop({double compareOffset = 50.0}) {
    if (!hasClients) return;
    if (offset < compareOffset) return;
    animateTo(
      0.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }
}
