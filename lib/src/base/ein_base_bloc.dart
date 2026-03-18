import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/ein_empty_param.dart';
import '../model/ein_error_param.dart';
import 'ein_base_bloc_state.dart';

abstract class EinBaseBloc extends BlocBase<EinBaseBlocState> {
  EinBaseBloc() : super(EinBlocStateInit());

  bool _loading = false;
  bool _dialog = false;

  void dispose() {}

  void safeEmit(EinBaseBlocState state) {
    if (!isClosed) emit(state);
  }

  void startLoading({bool asDialog = false}) {
    if (_loading) return;
    _loading = true;
    _dialog = asDialog;
    _dialog
        ? safeEmit(EinBlocStateLoadingDialog())
        : safeEmit(EinBlocStateLoading());
  }

  void stopLoading() {
    if (!_loading) return;
    _loading = false;
    _dialog
        ? safeEmit(EinBlocStateLoadedDialog())
        : safeEmit(EinBlocStateLoaded());
  }

  void showError(EinErrorParam param, {bool? forceDialog}) {
    final asDialog = forceDialog ?? _dialog;
    asDialog
        ? safeEmit(EinBlocStateErrorDialog(param))
        : safeEmit(EinBlocStateError(param));
  }

  void showEmpty(EinEmptyParam param) {
    safeEmit(EinBlocStateEmpty(param));
  }

  Future<void> execute({
    required Future<void> Function() requesting,
    void Function(EinErrorParam param)? onError,
  }) async {
    if (_loading) return;
    try {
      await requesting();
    } catch (exception) {
      stopLoading();
      final param = _errorHandler(exception);
      onError != null ? onError.call(param) : showError(param);
    }
  }

  EinErrorParam _errorHandler(dynamic exception) {
    final (code, message) = switch (exception) {
      _ => (exception.hashCode, exception.toString()),
    };
    return EinErrorParam(code, message);
  }
}
