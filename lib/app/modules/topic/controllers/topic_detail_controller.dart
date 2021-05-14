import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/modules/topic/api/topic_api.dart';

class TopicDetailController extends GetxController {
  final TopicApi _topicApi = Get.find();
  List<Photo> photoList = [];
  int _page = 1;
  bool isLoading = true;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
    _fetchTopicPhoto();
  }

  _fetchTopicPhoto() {
    _topicApi
        .fetchTopicPhoto(page: _page, topicId: Get.arguments[0])
        .then((data) {
      if (data.isNotEmpty) photoList.addAll(data);
      _page++;
      isLoading = false;
      update();
    });
  }

  onRefresh() {
    _page = 1;
    photoList.clear();
    _fetchTopicPhoto();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _fetchTopicPhoto();
    }
  }
}
