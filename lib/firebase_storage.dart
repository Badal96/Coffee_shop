import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Fstoarage {
  final storageRef = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  void onuploade(User user) async {
    final images = storageRef.child('images');

    final useridpath = images.child(user.uid);

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    File file = File(image.path);

    try {
      UploadTask uploadTask = useridpath.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      String dowloadurl = await taskSnapshot.ref.getDownloadURL();

      user.updatePhotoURL(dowloadurl);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
