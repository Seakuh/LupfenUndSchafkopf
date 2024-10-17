import 'package:flutter/material.dart';

class LupfenGameScreen extends StatefulWidget {
  @override
  _LupfenGameScreenState createState() => _LupfenGameScreenState();
}

class _LupfenGameScreenState extends State<LupfenGameScreen> {
  late List<String> playerNames;
  late List<double> playerBets;
  late String gameName;
  late bool isMandatoryRound;

  int pot = 0;
  int currentPlayer = 0;
  List<int> tricksWon = []; // Anzahl der Stiche für jeden Spieler

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    playerNames = args['playerNames'];
    playerBets = args['playerBets'];
    gameName = args['gameName'];
    isMandatoryRound = args['isMandatoryRound'];

    // Setze den Pot basierend auf den Einsätzen
    pot = playerBets.fold(0, (sum, bet) => sum + bet.toInt());
    tricksWon =
        List<int>.filled(playerNames.length, 0); // Startwerte für die Stiche
  }

  void playTurn() {
    setState(() {
      // Logik für einen Zug (hier nur ein Platzhalter für die Demonstration)
      tricksWon[currentPlayer] += 1;
      currentPlayer = (currentPlayer + 1) % playerNames.length;
    });
  }

  void endGame() {
    // Logik zur Endabrechnung der Stiche und zur Aufteilung des Pots
    // Beispiel: Einfacher Modus
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pot: $pot €',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Spielzustand anzeigen
            Expanded(
              child: ListView.builder(
                itemCount: playerNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${playerNames[index]}'),
                    subtitle: Text(
                        'Einsätze: ${playerBets[index]} € | Stiche: ${tricksWon[index]}'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: playTurn,
              child: Text('Nächster Zug'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: endGame,
              child: Text('Spiel Beenden'),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
