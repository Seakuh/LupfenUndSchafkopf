import 'package:flutter/material.dart';

class LupfenPlayerSetupScreen extends StatefulWidget {
  @override
  _LupfenPlayerSetupScreenState createState() =>
      _LupfenPlayerSetupScreenState();
}

class _LupfenPlayerSetupScreenState extends State<LupfenPlayerSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> playerNameControllers = [];
  List<TextEditingController> playerBetControllers = [];
  TextEditingController gameNameController = TextEditingController();
  int playerCount = 3; // Beispiel für die Anzahl der Spieler

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < playerCount; i++) {
      playerNameControllers.add(TextEditingController());
      playerBetControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    gameNameController.dispose();
    playerNameControllers.forEach((controller) => controller.dispose());
    playerBetControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lupfen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Spieler und Einsätze eingeben:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Eingabefelder für die Spieler
              Expanded(
                child: ListView.builder(
                  itemCount: playerCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: playerNameControllers[index],
                              decoration: InputDecoration(
                                labelText: 'Spieler ${index + 1} Name',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name ist erforderlich';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: playerBetControllers[index],
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                labelText: 'Einsatz (€)',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Einsatz erforderlich';
                                }
                                if (double.tryParse(value) == null) {
                                  return 'Ungültiger Betrag';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Start-Button mit Validierung
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Wenn das Formular gültig ist, zum nächsten Bildschirm navigieren
                    List<String> playerNames = playerNameControllers
                        .map((controller) => controller.text)
                        .toList();
                    List<double> playerBets = playerBetControllers
                        .map((controller) => double.parse(controller.text))
                        .toList();
                    String gameName = gameNameController.text;

                    Navigator.pushNamed(context, '/lupfen_game', arguments: {
                      'playerNames': playerNames,
                      'playerBets': playerBets,
                      'gameName': gameName,
                    });
                  }
                },
                child: Text('Start'),
              ),
              Spacer(),
              Text('Werbung!',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
