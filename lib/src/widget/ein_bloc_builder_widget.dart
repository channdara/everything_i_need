import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/ein_base_bloc.dart';
import '../base/ein_base_bloc_state.dart';
import '../model/ein_empty_param.dart';
import '../model/ein_error_param.dart';
import 'ein_empty_widget.dart';
import 'ein_error_widget.dart';
import 'ein_loading_widget.dart';

class EinBlocBuilderCustom<
  LOADING extends EinBaseBlocStateLoading,
  ERROR extends EinBaseBlocStateError,
  SUCCESS extends EinBaseBlocState
>
    extends StatelessWidget {
  const EinBlocBuilderCustom({
    super.key,
    required this.bloc,
    required this.builder,
    this.errorParam,
    this.emptyParam,
  });

  final EinBaseBloc bloc;
  final Widget Function(BuildContext context, SUCCESS state) builder;
  final EinErrorParam? errorParam;
  final EinEmptyParam? emptyParam;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      buildWhen: (previous, current) {
        return current is LOADING ||
            current is ERROR ||
            current is SUCCESS ||
            current is EinBlocStateEmpty;
      },
      builder: (context, state) {
        if (state is LOADING) {
          return const Center(child: EinLoadingWidget());
        }
        if (state is ERROR) {
          return EinErrorWidget(param: errorParam ?? state.param);
        }
        if (state is EinBlocStateEmpty) {
          return EinEmptyWidget(param: emptyParam ?? state.param);
        }
        if (state is SUCCESS) {
          return builder(context, state);
        }
        return const SizedBox();
      },
    );
  }
}

class EinBlocBuilderWidget<SUCCESS extends EinBaseBlocState>
    extends
        EinBlocBuilderCustom<EinBlocStateLoading, EinBlocStateError, SUCCESS> {
  const EinBlocBuilderWidget({
    super.key,
    required super.bloc,
    required super.builder,
    super.errorParam,
    super.emptyParam,
  });
}
