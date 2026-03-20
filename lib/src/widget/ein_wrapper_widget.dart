import 'package:flutter/widgets.dart';

import '../common/ein_common.dart';
import '../common/ein_media_query.dart';
import '../model/ein_empty_param.dart';
import '../model/ein_error_param.dart';

class EinWrapperWidget extends InheritedWidget {
  EinWrapperWidget({
    super.key,
    required BuildContext context,
    required super.child,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
  }) {
    EinMediaQuery.initialize(context);
  }

  final Widget? loadingWidget;
  final Widget Function(EinErrorParam param)? errorWidget;
  final Widget Function(EinEmptyParam param)? emptyWidget;

  static EinWrapperWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<EinWrapperWidget>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    final old = oldWidget as EinWrapperWidget;
    final condition = old.child != child ||
        old.loadingWidget != loadingWidget ||
        old.errorWidget != errorWidget ||
        old.emptyWidget != emptyWidget;
    logDebug(['EverythingINeed.updateShouldNotify', condition]);
    return condition;
  }
}
