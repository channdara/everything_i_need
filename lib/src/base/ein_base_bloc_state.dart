import '../model/ein_error_param.dart';

abstract class EinBaseBlocState {}

abstract class EinBaseBlocStateLoading extends EinBaseBlocState {}

abstract class EinBaseBlocStateLoaded extends EinBaseBlocState {}

abstract class EinBaseBlocStateError extends EinBaseBlocState {
  EinBaseBlocStateError(this.param, {this.barrierDismissible = true});

  final EinErrorParam param;
  final bool barrierDismissible;
}

class EinBlocStateInit extends EinBaseBlocState {}

class EinBlocStateLoading extends EinBaseBlocStateLoading {}

class EinBlocStateLoadingDialog extends EinBaseBlocStateLoading {
  EinBlocStateLoadingDialog({this.barrierDismissible = false});

  final bool barrierDismissible;
}

class EinBlocStateLoaded extends EinBaseBlocStateLoaded {}

class EinBlocStateLoadedDialog extends EinBaseBlocStateLoaded {}

class EinBlocStateError extends EinBaseBlocStateError {
  EinBlocStateError(super.param, {super.barrierDismissible});
}

class EinBlocStateErrorDialog extends EinBaseBlocStateError {
  EinBlocStateErrorDialog(super.param, {super.barrierDismissible});
}

class EinBlocStateEmpty extends EinBaseBlocState {}
