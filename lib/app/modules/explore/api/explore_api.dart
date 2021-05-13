import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:martin_app/app/core/api_base_helper.dart';
import 'package:martin_app/app/model/collection.dart';

class ExploreApi {
  Future<List<Collection>> fetchExploreCollection({page}) async {
    final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();

    final Response response = await _dio.getMethodWithHeader(
      'collections/',
      body: {
        "page": page,
      },
    );
    return (response.data as List).map((e) => Collection.fromJson(e)).toList();
  }
}
