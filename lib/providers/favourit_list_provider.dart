import 'package:coffee_shop/pages/coffe_detail_page/coffee_detail.dart';
import 'package:flutter/cupertino.dart';

class FavouritListProvider extends ChangeNotifier {
  List<CoffeeDetial> favouritList = [];

  void addorRemove(CoffeeDetial coffeitem) {
    favouritList.contains(coffeitem)
        ? favouritList.remove(coffeitem)
        : favouritList.add(coffeitem);
    notifyListeners();
  }
}
