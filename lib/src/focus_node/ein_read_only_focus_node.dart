import 'package:flutter/widgets.dart';

class EinReadOnlyFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
