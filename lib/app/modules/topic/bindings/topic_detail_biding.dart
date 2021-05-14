import 'package:get/get.dart';
import 'package:martin_app/app/modules/topic/controllers/topic_detail_controller.dart';

class TopicDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicDetailController>(() => TopicDetailController());
    // Get.lazyPut<TopicApi>(() => TopicApi());
  }
}
