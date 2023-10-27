import 'package:flutter/foundation.dart';

import '../htttp_requests.dart';
import '../models/coffee_model.dart';

class DetailProvider extends ChangeNotifier {
 
 CoffeeModel? singlecoffee ;
  bool loading = false;
  String selectedSize = 'medium';

   void  changesize (String text) {

  switch (text) {
    case 'S':
      selectedSize = 'small';
      notifyListeners();
      break;
      case 'M':
      selectedSize = 'medium';
      notifyListeners();
      break;
      case 'L' :
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
}