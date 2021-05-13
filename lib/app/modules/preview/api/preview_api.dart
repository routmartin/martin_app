import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:martin_app/app/core/api_base_helper.dart';
import 'package:martin_app/app/model/photo.dart';

class PreviewPhotoApi {
  Future<Photo> fetchPreviewPhoto({photoId}) async {
    final ApiBaseHelper _dio = Get.find<ApiBaseHelper>();

    final Response response = await _dio.getMethodWithHeader(
      'photos/$photoId',
    );
    return Photo.fromJson(response.data);
  }
}
