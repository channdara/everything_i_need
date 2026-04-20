import 'package:flutter/material.dart';

import '../controller/ein_paginated_scroll_controller.dart';
import '../model/ein_paginated_model.dart';
import 'ein_loading_widget.dart';

class EinListViewPaginatedWidget<T> extends StatelessWidget {
  const EinListViewPaginatedWidget({
    super.key,
    required this.controller,
    required this.itemBuilder,
    this.separatorBuilder,
  });

  final EinPaginatedScrollController controller;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemCount: controller.itemCount,
      separatorBuilder:
          separatorBuilder ?? (context, index) => const SizedBox(),
      itemBuilder: (context, index) {
        final itemType = controller.getItemAt(index);
        return switch (itemType) {
          EinPaginatedLoading() => const EinLoadingWidget(),
          EinPaginatedData<T>() => itemBuilder(context, index, itemType.item),
          _ => const SizedBox(),
        };
      },
    );
  }
}
