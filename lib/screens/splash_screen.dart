import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double buttonFontSize = 24;

  @override
  void initState() {
    super.initState();
    // Timer setzt Navigation zum Hauptmenü nach 3 Sekunden
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main_menu');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'Willkommen zur Spiel App!',
          style: TextStyle(fontSize: buttonFontSize, color: Colors.white),
        ),
      ),
    );
  }
}
