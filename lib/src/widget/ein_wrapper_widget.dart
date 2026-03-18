import 'package:flutter/widgets.dart';

import '../common/ein_common.dart';
import '../common/ein_media_query.dart';
import '../model/ein_error_param.dart';

class EinWrapperWidget extends InheritedWidget {
  EinWrapperWidget({
    super.key,
    required BuildContext context,
    required super.child,
    this.loadingWidget,
    this.errorDialogWidget,
  }) {
    EinMediaQuery.initialize(context);
  }

  final Widget? loadingWidget;
  final Widget Function(EinErrorParam param)? errorDialogWidget;

  static EinWrapperWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<EinWrapperWidget>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    logDebug(['EverythingINeed.updateShouldNotify', oldWidget != this]);
    return oldWidget != this;
  }
}
