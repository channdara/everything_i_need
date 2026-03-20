import 'package:flutter/material.dart';

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
              Text(
                param.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              if (param.content != null) ...[
                const SizedBox(height: 8.0),
                Text(
                  param.content!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
  }
}
