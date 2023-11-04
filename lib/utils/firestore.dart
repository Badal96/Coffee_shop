import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/utils/auth.dart';

class FsStore {
  final db = FirebaseFirestore.instance;

  String postid = Auth().currrentUser!.uid;

  Future<void> adduserdata(String country, String city, String adress,
      List<double> maplocation) async {
    await db.collection('user_data').doc(postid).set({
      'user_location_name': {
        'country': country,
        'city': city,
        'adress': adress
      },
      'user_location_lat&long': maplocation
    });
  }

  Future<Map<String, dynamic>?> userLocationData() async {
    var snapshot = await db.collection('user_data').doc(postid).get();
    return snapshot.data();
  }
}
