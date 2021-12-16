import 'package:flutter/material.dart';
import 'dart:math';

class GameState extends ChangeNotifier {
  static final int _elementCount = 5 + Random().nextInt(5);
  int _chosen = Random().nextInt(_elementCount);
  List<int> _darkElements = [];
  List<int> _greenElements = [];

  void press(int pressedElement) {
    if (_darkElements.contains(pressedElement) ||
        _greenElements.contains(pressedElement)) {
    } else {
      if (pressedElement == _chosen) {
        _greenElements.add(pressedElement);
      } else {
        _darkElements.add(pressedElement);
      }
    }
    _chosen = Random().nextInt(_elementCount);
    notifyListeners();
  }

  bool isSpecial(int el) {
    return el == _chosen;
  }

  List getGreenEls() {
    return _greenElements;
  }

  List getDarkEls() {
    return _darkElements;
  }

  int getElementCount() {
    return _elementCount;
  }
}
