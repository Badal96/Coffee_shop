import 'package:coffee_shop/utils/htttp_requests.dart';
import 'package:flutter/foundation.dart';

import '../models/coffee_model.dart';

class DetailProvider extends ChangeNotifier {
  CoffeeModel? singlecoffee;
  bool loading = false;
  String selectedSize = 'medium';
  int orderCount = 1;
  double price = 4.53;
  double deliveryFee = 1;
  String deliverMethod = 'Deliver';

  void changeDeliverMethod(String delivermethod) {
    if (deliverMethod == delivermethod) {
      return;
    }
    if (delivermethod == 'Pick up') {
      deliverMethod = 'Pick up';
      notifyListeners();
    }
    if (delivermethod == 'Deliver') {
      deliverMethod = 'Deliver';
      notifyListeners();
    }
  }

  void changesize(String text) {
    switch (text) {
      case 'S':
        selectedSize = 'small';
        notifyListeners();
        break;
      case 'M':
        selectedSize = 'medium';
        notifyListeners();
        break;
      case 'L':
        selectedSize = 'large';
        notifyListeners();
        break;
    }
  }

  Future<void> getCoffeeItem(int id) async {
    loading = true;
    notifyListeners();

    final result = await HttpRequests().getSingleProducts(id); // call api

    singlecoffee = CoffeeModel.fromJson(result);
    loading = false;
    notifyListeners();
  }

  void addOrderCount() {
    orderCount++;
    notifyListeners();
  }

  void subtractCount() {
    if (orderCount > 1) orderCount--;
    notifyListeners();
  }
}
