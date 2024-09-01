import 'package:flutter/material.dart';

class ListController with ChangeNotifier {
  List<int> itemList = [1, 2, 3, 4, 5, 6, 7];

  addListItemFunction() {
    int last = itemList.last;
    itemList.add(last + 1);
    notifyListeners();
  }
}

class CountController with ChangeNotifier {
  int count = 10;

  increment() {
    count++;
    notifyListeners();
  }
}
