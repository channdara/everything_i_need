import 'package:flutter/material.dart';

import '../common/ein_text_style.dart';

class EinEmptyParam {
  EinEmptyParam({
    this.image,
    this.title,
    this.content,
    this.imageSize = const Size.square(64.0),
    this.imagePadding = const EdgeInsets.only(bottom: 32.0),
    this.titleTextStyle = EinTextStyle.s16Bold,
    this.contentTextStyle = EinTextStyle.s14,
  });

  final dynamic image;
  final String? title;
  final String? content;
  final Size imageSize;
  final EdgeInsetsGeometry imagePadding;
  final TextStyle titleTextStyle;
  final TextStyle contentTextStyle;
}
