import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../extension/ein_string_extension.dart';
import '../model/ein_empty_param.dart';
import 'ein_wrapper_widget.dart';

class EinEmptyWidget extends StatelessWidget {
  const EinEmptyWidget({super.key, required this.param});

  final EinEmptyParam param;

  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget.of(context)?.emptyWidget?.call(param) ??
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(),
              Text(
                param.title ?? '',
                style: param.titleTextStyle,
                textAlign: TextAlign.center,
              ),
              if (param.content != null) ...[
                const SizedBox(height: 8.0),
                Text(
                  param.content ?? '',
                  style: param.contentTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
  }

  Widget _buildImage() {
    final image = param.image;
    Widget? child;
    if (image is Widget) child = image;
    if (image is String) {
      if (image.isNetworkUrl) {
        child = CachedNetworkImage(
          imageUrl: image,
          height: param.imageSize.height,
          width: param.imageSize.width,
          fit: BoxFit.cover,
        );
      } else {
        child = Image.asset(
          image,
          height: param.imageSize.height,
          width: param.imageSize.width,
          fit: BoxFit.cover,
        );
      }
    }
    return child == null
        ? const SizedBox()
        : Padding(padding: param.imagePadding, child: child);
  }
}
