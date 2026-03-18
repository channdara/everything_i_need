import '../model/ein_empty_param.dart';
import '../model/ein_error_param.dart';

abstract class EinBaseBlocState {}

abstract class EinBaseBlocStateLoading extends EinBaseBlocState {}

abstract class EinBaseBlocStateLoaded extends EinBaseBlocState {}

abstract class EinBaseBlocStateError extends EinBaseBlocState {
  EinBaseBlocStateError(this.param);

  final EinErrorParam param;
}

class EinBlocStateInit extends EinBaseBlocState {}

class EinBlocStateLoading extends EinBaseBlocStateLoading {}

class EinBlocStateLoadingDialog extends EinBaseBlocStateLoading {}

class EinBlocStateLoaded extends EinBaseBlocStateLoaded {}

class EinBlocStateLoadedDialog extends EinBaseBlocStateLoaded {}

class EinBlocStateError extends EinBaseBlocStateError {
  EinBlocStateError(super.param);
}

class EinBlocStateErrorDialog extends EinBaseBlocStateError {
  EinBlocStateErrorDialog(super.param);
}

class EinBlocStateEmpty extends EinBaseBlocState {
  EinBlocStateEmpty(this.param);

  final EinEmptyParam param;
}
