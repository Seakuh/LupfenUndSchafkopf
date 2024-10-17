import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spiel App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Willkommen zur Spiel App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Abstand zwischen Text und Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lupfen');
              },
              child: Text('Lupfen spielen'),
            ),
            SizedBox(height: 10), // Abstand zwischen den Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/schafkopf');
              },
              child: Text('Schafkopf spielen'),
            ),
          ],
        ),
      ),
    );
  }
}
