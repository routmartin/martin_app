import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/modules/login/api/login_api.dart';

class LoginController extends GetxController {
  final LoginApi _loginApi = Get.find();
  UserCredential userCredential;
  signInWithGoogle() async {
    userCredential = await _loginApi.signInWithGoogle();
    print(userCredential);
    if (userCredential.user.uid != null) {
      String token = await userCredential.user.getIdToken();
    }
  }
}
