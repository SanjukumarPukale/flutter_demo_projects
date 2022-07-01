import 'package:flutter/widgets.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }


}