import 'dart:io';
import 'package:coffee_shop/utils/auth.dart';
import 'package:coffee_shop/utils/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UserdataProvider extends ChangeNotifier {
  User? user;
  Map<String, dynamic>? userlocation;

  void setuserLocation() async {
    userlocation = await FsStore().userLocationData();
    notifyListeners();
  }

  void editUserlocation(String country, city, address) async {
    try {
      List<Location> locations =
          await locationFromAddress('$country,$city,$address');

      if (locations.isNotEmpty) {
        double latitude = locations[0].latitude;
        double longitude = locations[0].longitude;
        await FsStore()
            .adduserdata(country, city, address, [latitude, longitude]);
        setuserLocation();
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

  void onuploade() async {
    final storageRef = FirebaseStorage.instance.ref();
    final ImagePicker picker = ImagePicker();

    final useridpath = storageRef.child('images').child(user!.uid);

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    File file = File(image.path);

    try {
      UploadTask uploadTask = useridpath.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String dowloadurl = await taskSnapshot.ref.getDownloadURL();

      await user!.updatePhotoURL(dowloadurl);
      getuser();
      notifyListeners();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  void createAcc(String email, String password, BuildContext context) async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);

      if (Auth().currrentUser == null) {
        return;
      } else {
        getuser();
        setuserLocation();
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      QuickAlert.show(
          context: context, type: QuickAlertType.error, text: (e).toString());
    }
  }

  void getuser() {
    user = Auth().currrentUser;
    setuserLocation();
  }

  void login(String email, String password, BuildContext context) async {
    try {
      await Auth().signin(email: email, password: password);

      if (Auth().currrentUser == null) {
        return;
      } else {
        user = Auth().currrentUser;
        setuserLocation();
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      QuickAlert.show(
          context: context, type: QuickAlertType.error, text: (e).toString());
    }
  }

  void googleSignin(String email, String password, BuildContext context) async {
    try {
      await Auth().googleSignin(email: email, password: password);

      if (Auth().currrentUser == null) {
        return;
      } else {
        user = Auth().currrentUser;
        setuserLocation();
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      QuickAlert.show(
          context: context, type: QuickAlertType.error, text: (e).toString());
    }
  }

  void signout() async {
    await Auth().signOut();
    userlocation = null;
    user = null;
    notifyListeners();
  }
}
