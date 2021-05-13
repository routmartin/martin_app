import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:martin_app/app/core/api_base_helper.dart';
import 'package:martin_app/app/model/photo.dart';

class ExploreShowApi {
  Future<List<Photo>> fetchExploreCollection({page, collectionId}) async {
    final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();

    final Response response = await _dio.getMethodWithHeader(
      'collections/$collectionId/photos/',
      body: {
        "page": page,
        "per_page": '20',
      },
    );
    return (response.data as List).map((e) => Photo.fromJson(e)).toList();
  }
}
