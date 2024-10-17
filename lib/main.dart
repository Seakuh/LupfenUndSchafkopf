import 'package:flutter/material.dart';
import 'package:spiel_app/screens/lupfen_game_screen.dart';
import 'package:spiel_app/screens/lupfen_player_setup_screen.dart';
import 'package:spiel_app/screens/lupfen_setup_screen.dart';

import 'screens/lupfen_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/schafkopf_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main_menu': (context) => MainMenuScreen(),
        '/lupfen': (context) => LupfenScreen(),
        '/schafkopf': (context) => SchafkopfScreen(),
        '/lupfen_setup': (context) => LupfenSetupScreen(),
        '/lupfen_game': (context) => LupfenGameScreen(),
        '/lupfen_player_setup': (context) => LupfenPlayerSetupScreen(),
      },
    );
  }
}
