import 'package:get/get.dart';
import 'package:martin_app/app/modules/search/api/search_api.dart';

import '../controllers/search_result_controller.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultController>(() => SearchResultController());
    Get.lazyPut<SearchApi>(() => SearchApi());
  }
}
