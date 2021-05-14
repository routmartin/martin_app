import 'package:get/get.dart';
import 'package:martin_app/app/modules/search/api/search_api.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<SearchApi>(() => SearchApi());
  }
}
