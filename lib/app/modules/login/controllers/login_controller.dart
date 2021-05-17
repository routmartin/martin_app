import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:martin_app/app/modules/login/api/login_api.dart';
import 'package:martin_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginApi _loginApi = Get.find();

  signInWithGoogle() async {
    GoogleSignInAuthentication googleSignInAuthentication =
        await _loginApi.signInWithGoogle();
    if (googleSignInAuthentication.accessToken != null) {
      String token = googleSignInAuthentication.accessToken;
      print(token);
      Get.toNamed(Routes.MAIN);
    } else {
      Get.snackbar('Failed', 'Sign In not success');
    }
  }

  signInWithFacebook() async {
    final result = await _loginApi.signInWithFacebook();

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        Get.toNamed(Routes.MAIN);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('cancelledByUser');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
