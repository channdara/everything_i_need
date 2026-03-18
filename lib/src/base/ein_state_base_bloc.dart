import 'package:flutter/material.dart';

import '../extension/ein_context_extension.dart';
import '../widget/ein_error_widget.dart';
import '../widget/ein_loading_widget.dart';
import 'ein_base_bloc.dart';
import 'ein_base_bloc_state.dart';
import 'ein_state_base.dart';

abstract class EinStateBaseBloc<T extends StatefulWidget, B extends EinBaseBloc>
    extends EinStateBase<T> {
  B? _bloc;
  bool _loadingDialogShown = false;

  B get bloc =>
      _bloc != null ? _bloc! : throw Exception('Bloc is not provided');

  @override
  void initState() {
    super.initState();
    _bloc = provideBloc();
    _bloc?.stream.listen((state) {
      setupObserver(state);
      switch (state) {
        case EinBlocStateLoadingDialog():
          if (mounted) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const EinLoadingWidget();
              },
            );
            _loadingDialogShown = true;
          }
        case EinBlocStateLoadedDialog():
          if (mounted && _loadingDialogShown) {
            context.pop();
            _loadingDialogShown = false;
          }
        case final EinBlocStateErrorDialog error:
          if (mounted) {
            showDialog<void>(
              context: context,
              builder: (context) {
                return Dialog(child: EinErrorWidget(param: error.param));
              },
            ).then((_) => onErrorDialogDismissed());
          }
      }
    });
  }

  @override
  void dispose() {
    _bloc?.dispose();
    _bloc?.close();
    super.dispose();
  }

  B provideBloc();

  void setupObserver(EinBaseBlocState state) {}

  void onErrorDialogDismissed() {}
}
