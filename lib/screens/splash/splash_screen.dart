import 'dart:async';

import 'package:contact_app/utiles/share_preference.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getIntroScreen();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: MediaQuery.sizeOf(context).width * 0.8,
        color: Colors.black87,
      ),
    );
  }
}
