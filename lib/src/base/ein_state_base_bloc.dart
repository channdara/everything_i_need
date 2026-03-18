import 'package:flutter/material.dart';

import '../extension/ein_context_extension.dart';
import '../widget/ein_error_dialog_widget.dart';
import '../widget/ein_loading_dialog_widget.dart';
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
        case final EinBlocStateLoadingDialog dialog:
          if (mounted) {
            showDialog<void>(
              context: context,
              barrierDismissible: dialog.barrierDismissible,
              builder: (context) {
                return EinLoadingDialogWidget(
                  barrierDismissible: dialog.barrierDismissible,
                );
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
              barrierDismissible: error.barrierDismissible,
              builder: (context) {
                return EinErrorDialogWidget(
                  param: error.param,
                  barrierDismissible: error.barrierDismissible,
                );
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
