import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
    final LoginResult result = await _loginApi.signInWithFacebook();
    switch (result.status) {
      case LoginStatus.success:
        if (result.accessToken != null) {
          print(result.accessToken);
          Get.toNamed(Routes.MAIN);
        }
        break;
      case LoginStatus.cancelled:
        Get.snackbar('cancelled', result.message,
            snackPosition: SnackPosition.BOTTOM);
        print(result.message);
        break;
      case LoginStatus.failed:
        Get.snackbar('failed', result.message,
            snackPosition: SnackPosition.BOTTOM);
        print(result.message);
        break;
      default:
        Get.snackbar('default', result.message,
            snackPosition: SnackPosition.BOTTOM);
        print(result.message);
    }
  }
}
