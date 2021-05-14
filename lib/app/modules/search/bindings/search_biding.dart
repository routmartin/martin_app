import 'package:get/get.dart';
import 'package:martin_app/app/modules/search/controllers/search_controller.dart';
import 'package:martin_app/app/sqlite/search_history.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => SearchHistoryLocalStorage());
  }
}
