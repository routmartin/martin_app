import 'package:get/get.dart';
import 'package:martin_app/app/modules/preview/api/preview_api.dart';

import '../controllers/preview_controller.dart';

class PreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewController>(() => PreviewController());
    Get.lazyPut<PreviewPhotoApi>(() => PreviewPhotoApi());
  }
}
