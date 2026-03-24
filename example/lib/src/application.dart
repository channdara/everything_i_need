import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import 'presentation/screen/splash/splash_screen.dart';

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
      home: EinWrapperWidget(context: context, child: const SplashScreen()),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        cardTheme: const CardThemeData(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          year2023: false,
        ),
      ),
    );
  }
}
