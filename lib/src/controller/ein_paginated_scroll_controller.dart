import 'package:flutter/widgets.dart';

import '../model/ein_paginated_model.dart';

class EinPaginatedScrollController extends ScrollController {
  final List<EinPaginatedModel> _list = [];
  double? _reserveHeight;
  bool? _hasNext;

  int get itemCount => _list.length;

  @override
  void dispose() {
    _list.clear();
    _reserveHeight = null;
    _hasNext = null;
    super.dispose();
  }

  EinPaginatedModel getItemAt(int index) => _list[index];

  void append<T>(List<T> data, {bool? hasNext, bool? clear}) {
    _hasNext = hasNext;
    if (true == clear) _list.clear();
    if (_list.isNotEmpty && _list.last is EinPaginatedLoading) {
      _list.removeLast();
    }
    final mapped = data.map((e) => EinPaginatedData(e));
    _list.addAll(mapped);
    if (true == hasNext) _list.add(EinPaginatedLoading());
  }

  void setupPaginatedListener(VoidCallback callback, {double reserve = 0.0}) {
    addListener(() {
      if (!hasClients) return;
      final current = position.pixels;
      final maxScrollExtent = position.maxScrollExtent;
      _reserveHeight ??= reserve.clamp(0.0, 1.0) * maxScrollExtent;
      final maximum = maxScrollExtent - (_reserveHeight ?? 0.0);
      if (current >= maximum && true == _hasNext) callback();
    });
  }
}
