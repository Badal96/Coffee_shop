import 'package:flutter/foundation.dart';

class FilterProvider extends ChangeNotifier {
 
  List<int> selctedFilters = [];

  void addremoveFilter(int value) {
   itemExists(value)
        ? selctedFilters.remove(value)
        : selctedFilters.add(value);
    notifyListeners();
  }
  bool itemExists (int value) {
     return selctedFilters.contains(value);
  }
}

