import 'package:flutter/foundation.dart';

class GameProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void increaseScore() {
    _score++;
    notifyListeners();
  }
}
