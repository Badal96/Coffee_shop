import 'package:coffee_shop/models/coffee_model.dart';
import 'package:flutter/cupertino.dart';

class FavouritListProvider extends ChangeNotifier {
  List<CoffeeModel> favouritList = [];

  void addorRemove(CoffeeModel coffeitem) {
    favouritList.contains(coffeitem)
        ? favouritList.remove(coffeitem)
        : favouritList.add(coffeitem);
    notifyListeners();
  }
}
