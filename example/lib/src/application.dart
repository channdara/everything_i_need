import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import 'presentation/screen/splash_screen.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void dispose() {
    disposeEin();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EinWrapperWidget(
        context: context,
        loadingWidget: const CircularProgressIndicator.adaptive(),
        errorWidget: (param) => const SizedBox(),
        emptyWidget: (param) => const SizedBox(),
        child: const SplashScreen(),
      ),
    );
  }
}
