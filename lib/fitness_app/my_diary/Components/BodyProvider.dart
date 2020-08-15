import 'package:flutter/cupertino.dart';

class Body extends ChangeNotifier {
  List<BodyButton> buttons = [
    BodyButton('Huyết Áp'),
    BodyButton('Phân tích giấc ngủ'),
    BodyButton('Nhịp tim'),
    BodyButton('Tần số hô hấp'),
  ];

  int currentButton;
}

class BodyButton extends ChangeNotifier {
  final String text;
  BodyButton(this.text);
  bool _selected = false;

  get selected => _selected;

  set selected(value) {
    if (_selected == value) return;

    _selected = value;
    notifyListeners();
  }
}
