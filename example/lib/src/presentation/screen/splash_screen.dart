import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Screen')),
      body: Center(
        child: Text(
          [
            EinMediaQuery.screenWidth(),
            EinMediaQuery.screenHeight(),
            EinMediaQuery.paddingTop(),
            EinMediaQuery.paddingBottom(),
          ].join('\n'),
        ),
      ),
    );
  }
}
