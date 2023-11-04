import 'package:coffee_shop/utils/htttp_requests.dart';
import 'package:flutter/foundation.dart';

import '../models/coffee_model.dart';

class CoffeProvider extends ChangeNotifier {
  List<CoffeeModel> coffees = [];
  List<CoffeeModel> nameFilteredCoffes = [];
  String namedfilter = '';
  bool loading = false;

  Future<void> getCoffeList() async {
    loading = true;
    notifyListeners();

    final result = await HttpRequests().getAllProducts();

    result?.forEach((e) {
      coffees.add(CoffeeModel.fromJson(e));
    });
    loading = false;
    notifyListeners();
  }

  void filterWithNamed(String input) {
    namedfilter = input;
    notifyListeners();

    nameFilteredCoffes = List<CoffeeModel>.from(coffees.where(
      (element) =>
          element.title!.toLowerCase().contains(namedfilter.toLowerCase()),
    ));
    notifyListeners();
  }
}
