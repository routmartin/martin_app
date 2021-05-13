import 'package:get/get.dart';
import 'package:martin_app/app/modules/explore/api/explore_api.dart';
import 'package:martin_app/app/modules/explore/controllers/explore_controller.dart';
import 'package:martin_app/app/modules/topic/api/topic_api.dart';
import 'package:martin_app/app/modules/topic/controllers/topic_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<ExploreApi>(() => ExploreApi());
    Get.lazyPut<TopicController>(() => TopicController());
    Get.lazyPut<TopicApi>(() => TopicApi());
  }
}
