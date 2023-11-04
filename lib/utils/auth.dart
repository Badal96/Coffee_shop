import 'package:coffee_shop/utils/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final GoogleSignIn _googleauth = GoogleSignIn();

  final FirebaseAuth _firebaseAeuth = FirebaseAuth.instance;

  GoogleSignInAccount? _guser;

  GoogleSignInAccount get guser => _guser!;

  User? get currrentUser => _firebaseAeuth.currentUser;

  Stream<User?> get authStateChnages => _firebaseAeuth.authStateChanges();

  Future googleSignin({required String email, required String password}) async {
    final googleuser = await _googleauth.signIn();

    if (googleuser == null) return;
    _guser = googleuser;

    final gauth = await googleuser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: gauth.accessToken, idToken: gauth.idToken);
    await _firebaseAeuth.signInWithCredential(credential);
    final alrdyaUser = await FsStore().userLocationData();
    if (alrdyaUser == null) {
      await FsStore()
          .adduserdata('no location chosed.', '', '', [40.7942, 43.84528]);
    }
  }

  Future<void> signin({required String email, required String password}) async {
    await _firebaseAeuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAeuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await FsStore()
        .adduserdata('location not chosed', '', '', [40.7942, 43.84528]);
  }

  Future<void> signOut() async {
    await _googleauth.signOut();
    await _firebaseAeuth.signOut();
  }
}
