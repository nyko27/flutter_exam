import 'package:flutter/material.dart';
import 'dart:math';

class GameState extends ChangeNotifier {
  static final int _elementCount = 5 + Random().nextInt(5);
  int _chosen = Random().nextInt(_elementCount);
  int? _darkElement;
  final List<int> _greenElements = [];
  List<int> _greyElements = List<int>.generate(_elementCount, (i) => i);

  int get elementCount => _elementCount;

  void press(int pressedElement) {
    if (_greyElements.contains(pressedElement)) {
      if (_greenElements.length == elementCount - 1) {
        _greyElements = List<int>.generate(_elementCount, (i) => i);
        _greenElements.clear();
        _darkElement = null;
        notifyListeners();
        return;
      }

      _greyElements.remove(pressedElement);

      if (pressedElement == _chosen) {
        _greenElements.add(pressedElement);
      } else {
        if (_darkElement != null) {
          _greyElements.add(_darkElement!);
        }

        _darkElement = pressedElement;
      }

      try {
        _chosen = _greyElements[Random().nextInt(_greyElements.length)];
      } catch (e) {
        _chosen = _darkElement!;
        _greyElements.add(_darkElement!);
        _darkElement = null;
      }

      notifyListeners();
    }
  }

  Color getBlockColor(int element) {
    return _darkElement == element
        ? Colors.grey.shade700
        : _greenElements.contains(element)
            ? Colors.green
            : Colors.grey;
  }

  String getBlockText(int element) {
    return _darkElement == element ? "" : 'Element ${element + 1}';
  }
}
