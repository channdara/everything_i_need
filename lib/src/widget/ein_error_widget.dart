import 'package:flutter/material.dart';

import '../model/ein_error_param.dart';
import 'ein_wrapper_widget.dart';

class EinErrorWidget extends StatelessWidget {
  const EinErrorWidget({super.key, required this.param});

  final EinErrorParam param;

  @override
  Widget build(BuildContext context) {
    return EinWrapperWidget.of(context)?.errorWidget?.call(param) ??
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                param.isUnauthorized ? 'Unauthorized' : 'Something went wrong',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                param.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        );
  }
}
