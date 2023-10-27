import 'package:flutter/foundation.dart';

import '../htttp_requests.dart';
import '../models/coffee_model.dart';

class CoffeProvider extends ChangeNotifier {
  List<CoffeeModel> coffees = [];
  bool loading = false;

  Future<void> getCoffeList() async {
    loading = true;
    notifyListeners();

    final result = await HttpRequests().getAllProducts();
    print('object');
    result?.forEach((e) {
      print('object');
      coffees.add(CoffeeModel.fromJson(e));
    });
    loading = false;
    notifyListeners();
  }
}
