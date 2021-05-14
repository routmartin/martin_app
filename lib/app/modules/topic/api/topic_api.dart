import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:martin_app/app/core/api_base_helper.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/model/topic.dart';

class TopicApi {
  Future<List<Topic>> fetchTopicList({page}) async {
    final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();

    final Response response = await _dio.getMethodWithHeader(
      'topics/',
      body: {
        "page": page,
        "order_by": "featured",
        "per_page": '100',
      },
    );

    return (response.data as List).map((e) => Topic.fromMap(e)).toList();
  }

  Future<List<Photo>> fetchTopicPhoto({page, topicId}) async {
    final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();

    final Response response = await _dio.getMethodWithHeader(
      'topics/$topicId/photos',
      body: {
        "page": page,
        "per_page": '100',
      },
    );

    return (response.data as List).map((e) => Photo.fromJson(e)).toList();
  }
}
