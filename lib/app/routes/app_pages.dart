import 'package:get/get.dart';

import 'package:martin_app/app/modules/explore/views/explore_view.dart';
import 'package:martin_app/app/modules/explore_show/bindings/explore_show_binding.dart';
import 'package:martin_app/app/modules/explore_show/views/explore_show_view.dart';
import 'package:martin_app/app/modules/home/bindings/home_binding.dart';
import 'package:martin_app/app/modules/home/views/home_view.dart';
import 'package:martin_app/app/modules/login/bindings/login_binding.dart';
import 'package:martin_app/app/modules/login/views/login_view.dart';
import 'package:martin_app/app/modules/main/bindings/main_binding.dart';
import 'package:martin_app/app/modules/main/views/main_view.dart';
import 'package:martin_app/app/modules/preview/bindings/preview_binding.dart';
import 'package:martin_app/app/modules/preview/views/preview_view.dart';
import 'package:martin_app/app/modules/search/bindings/search_biding.dart';
import 'package:martin_app/app/modules/search/bindings/search_result_binding.dart';
import 'package:martin_app/app/modules/search/views/search_result_view.dart';
import 'package:martin_app/app/modules/search/views/search_view.dart';
import 'package:martin_app/app/modules/topic/bindings/topic_detail_biding.dart';
import 'package:martin_app/app/modules/topic/views/topic_detail_view.dart';
import 'package:martin_app/app/modules/topic/views/topic_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.EXPLORE,
      page: () => ExploreView(),
    ),
    GetPage(
        name: Routes.EXPLORE_SHOW,
        page: () => ExploreShowView(),
        binding: ExploreShowBinding()),
    GetPage(
      name: Routes.PREVIEW,
      page: () => PreviewView(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: Routes.TOPIC,
      page: () => TopicView(),
    ),
    GetPage(
        name: Routes.TOPIC_DETAIL,
        page: () => TopicDetailView(),
        binding: TopicDetailBinding()),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_RESULT,
      page: () => SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
