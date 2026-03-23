import 'package:everything_i_need/everything_i_need.dart';
import 'package:flutter/material.dart';

import '../main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) context.pushReplaceAll(const MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
