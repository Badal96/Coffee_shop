import 'package:coffee_shop/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserdataProvider extends ChangeNotifier {
  User? user;
  String errormeasge = '';
  Future<void> login(String email, String password) async {
    clearEroorMessage();
    try {
      await Auth().signin(email: email, password: password);

      if (Auth().currrentUser == null) {
        return;
      } else {
        user = Auth().currrentUser;
      }
      notifyListeners();
    } on FirebaseException catch (e) {
      errormeasge = e.toString();
      notifyListeners();
    }
  }

  Future<void> signout() async {
    try {
      await Auth().signOut();
    } on FirebaseException catch (e) {
      errormeasge = e.toString();
      notifyListeners();
      return;
    }

    user = null;
    clearEroorMessage();
  }

  void clearEroorMessage() {
    errormeasge = '';
    notifyListeners();
  }
}
