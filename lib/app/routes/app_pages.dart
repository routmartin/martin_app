import 'package:get/get.dart';

import 'package:martin_app/app/modules/explore/views/explore_view.dart';
import 'package:martin_app/app/modules/explore_show/bindings/explore_show_binding.dart';
import 'package:martin_app/app/modules/explore_show/views/explore_show_view.dart';
import 'package:martin_app/app/modules/home/bindings/home_binding.dart';
import 'package:martin_app/app/modules/home/views/home_view.dart';
import 'package:martin_app/app/modules/main/bindings/main_binding.dart';
import 'package:martin_app/app/modules/main/views/main_view.dart';
import 'package:martin_app/app/modules/preview/bindings/preview_binding.dart';
import 'package:martin_app/app/modules/preview/views/preview_view.dart';
import 'package:martin_app/app/modules/topic/views/topic_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

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
      binding: ExploreShowBinding(),
    ),
    GetPage(
      name: Routes.PREVIEW,
      page: () => PreviewView(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: Routes.TOPIC,
      page: () => TopicView(),
    ),
  ];
}
