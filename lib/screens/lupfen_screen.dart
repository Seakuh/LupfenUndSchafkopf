import 'package:flutter/material.dart';

class LupfenScreen extends StatefulWidget {
  @override
  _LupfenScreenState createState() => _LupfenScreenState();
}

class _LupfenScreenState extends State<LupfenScreen> {
  int pot = 0;
  String trumpSuit = '';
  List<String> playerCards = []; // Beispiel: Dynamisch anpassen

  void startGame() {
    setState(() {
      pot = 10; // Beispielwert für den Pot
      trumpSuit = 'Eicheln'; // Beispielwert
      playerCards = ['As', 'König', 'Ober']; // Dummy-Karten
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupfen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trumpf: $trumpSuit'),
            Text('Pot: $pot'),
            SizedBox(height: 20),
            Text('Deine Karten:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: playerCards.map((card) => Text('$card ')).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startGame,
              child: Text('Spiel Starten'),
            ),
          ],
        ),
      ),
    );
  }
}
