import 'package:flutter/cupertino.dart';

class Chart extends ChangeNotifier {
  List<Button> buttons = [
    Button('Tất cả'),
    Button('1T'),
    Button('3T'),
    Button('5T'),
    Button('7T'),
  ];

  int currentButton;
}

class Button extends ChangeNotifier {
  final String text;
  Button(this.text);
  bool _selected = false;

  get selected => _selected;

  set selected(value) {
    if (_selected == value) return;

    _selected = value;
    notifyListeners();
  }
}
