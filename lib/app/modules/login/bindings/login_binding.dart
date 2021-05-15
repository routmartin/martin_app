import 'package:get/get.dart';
import 'package:martin_app/app/modules/login/api/login_api.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginApi>(() => LoginApi());
  }
}
