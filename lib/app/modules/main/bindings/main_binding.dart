import 'package:get/get.dart';
import 'package:martin_app/app/modules/explore/api/explore_api.dart';
import 'package:martin_app/app/modules/topic/api/topic_api.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    Get.lazyPut<ExploreApi>(() => ExploreApi());

    Get.lazyPut<TopicApi>(() => TopicApi());
  }
}
