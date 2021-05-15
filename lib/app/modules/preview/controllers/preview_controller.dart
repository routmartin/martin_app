import 'package:get/get.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/modules/preview/api/preview_api.dart';

class PreviewController extends GetxController {
  final PreviewPhotoApi _previewPhotoApi = Get.find();
  Photo previePhoto;
  bool isLoading = true;

  @override
  void onReady() {
    super.onReady();
    fetchPreviewPhoto();
  }

  fetchPreviewPhoto() {
    _previewPhotoApi.fetchPreviewPhoto(photoId: Get.arguments[0]).then((data) {
      previePhoto = data;
      isLoading = false;
      update();
    });
  }
}
