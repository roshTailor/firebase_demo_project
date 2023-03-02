import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  // FirebaseHelper._();
  // static FirebaseHelper instance = FirebaseHelper._();

  static FirebaseHelper instance = FirebaseHelper();
  User? user;

  authAnonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();

      print("Sign in temporary");
    } catch (error) {
      print(error);
    }
  }

  authCreateUser({required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print("Create new user");
      user = userCredential.user;
      print("Registered user :: $user");
    } catch (error) {
      print(error);
    }
  }

  authSignInUser({required String email, required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      print("Sign in success");
    } catch (error) {
      print(error);
    }
  }

  authGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
