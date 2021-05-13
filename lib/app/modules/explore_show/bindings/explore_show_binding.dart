import 'package:get/get.dart';
import 'package:martin_app/app/modules/explore_show/api/explore_show_api.dart';

import '../controllers/explore_show_controller.dart';

class ExploreShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreShowController>(() => ExploreShowController());
    Get.lazyPut<ExploreShowApi>(() => ExploreShowApi());
  }
}
