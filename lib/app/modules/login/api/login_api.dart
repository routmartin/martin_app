// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginApi {
  Future<GoogleSignInAuthentication> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      return googleAuth;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<LoginResult> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
