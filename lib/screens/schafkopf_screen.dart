import 'package:flutter/material.dart';

class SchafkopfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schafkopf'),
      ),
      body: Center(
        child: Text(
          'Willkommen zum Schafkopf-Spiel!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
