import 'package:flutter/foundation.dart';

class FilterProvider extends ChangeNotifier {
  List<int> selctedIngridients = [];

  void addremoveFilter(int value) {
    itemExists(value)
        ? selctedIngridients.remove(value)
        : selctedIngridients.add(value);
    notifyListeners();
  }

  bool itemExists(int value) {
    return selctedIngridients.contains(value);
  }

  void clearFilter() {
    selctedIngridients = [];
    notifyListeners();
  }
}
