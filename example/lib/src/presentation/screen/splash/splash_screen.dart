import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../main/main_screen.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_bloc_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends EinStateBaseBloc<SplashScreen, SplashBloc> {
  @override
  SplashBloc provideBloc() => SplashBloc();

  @override
  void initStatePostFrameCallback(Duration duration) {
    super.initStatePostFrameCallback(duration);
    bloc.fetchUsers();
  }

  @override
  void setupObserver(EinBaseBlocState state) {
    super.setupObserver(state);
    if (state is SplashStateGotUsers && mounted) {
      context.pushReplaceAll(const MainScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
