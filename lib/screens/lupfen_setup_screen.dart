import 'package:flutter/material.dart';

class LupfenSetupScreen extends StatefulWidget {
  @override
  _LupfenSetupScreenState createState() => _LupfenSetupScreenState();
}

class _LupfenSetupScreenState extends State<LupfenSetupScreen> {
  int playerCount = 3; // Standardwert
  double betAmount = 0.0;
  bool isMandatoryRound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupfen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Anzahl Spieler
            Row(
              children: [
                Expanded(
                    child: Text('Anzahl Spieler:',
                        style: TextStyle(fontSize: 18))),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '3-5 -> 3 default',
                    ),
                    onChanged: (value) {
                      setState(() {
                        playerCount = int.tryParse(value) ?? 3;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Einsatz
            Row(
              children: [
                Expanded(
                    child: Text('Einsatz:', style: TextStyle(fontSize: 18))),
                SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Einsatz in €',
                    ),
                    onChanged: (value) {
                      setState(() {
                        betAmount = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Pflicht Runde
            Row(
              children: [
                Expanded(
                    child:
                        Text('Pflichtrunde?', style: TextStyle(fontSize: 18))),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isMandatoryRound,
                      onChanged: (value) {
                        setState(() {
                          isMandatoryRound = value!;
                        });
                      },
                    ),
                    Text('Ja'),
                    Radio(
                      value: false,
                      groupValue: isMandatoryRound,
                      onChanged: (value) {
                        setState(() {
                          isMandatoryRound = value!;
                        });
                      },
                    ),
                    Text('Nein'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            // Weiter-Button
            ElevatedButton(
              onPressed: () {
                // Hier zur Spielseite navigieren und die eingegebenen Werte übergeben
                Navigator.pushNamed(context, '/lupfen_player_setup',
                    arguments: {
                      'playerCount': playerCount,
                      'betAmount': betAmount,
                      'isMandatoryRound': isMandatoryRound,
                    });
              },
              child: Text('Weiter'),
            ),
            Spacer(),
            // Werbung-Text oder Banner kann hier hinzugefügt werden
            Text('Werbung!',
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
