import 'package:get/get.dart';

import 'package:martin_app/app/modules/topic/api/topic_api.dart';

import '../controllers/topic_controller.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicController>(() => TopicController());
    Get.lazyPut<TopicApi>(() => TopicApi());
  }
}
