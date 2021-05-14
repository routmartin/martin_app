import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:martin_app/app/core/api_base_helper.dart';
import 'package:martin_app/app/model/photo.dart';

class SearchApi {
  final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();
  Future<List<Photo>> searchPhoto({page, query}) async {
    final Response response = await _dio.getMethodWithHeader(
      'search/photos/',
      body: {
        "query": query,
        "page": page,
        "per_page": '30',
      },
    );
    print(response.data);
    return (response.data['results'] as List)
        .map((e) => Photo.fromJson(e))
        .toList();
  }
}
