import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/topic.dart';
import 'package:martin_app/app/modules/topic/api/topic_api.dart';

class TopicController extends GetxController {
  final TopicApi _topicApi = Get.find();
  List<Topic> topicList = [];
  int _page = 1;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
    _fetchTopicData();
  }

  _fetchTopicData() {
    _topicApi.fetchTopicList(page: _page).then((data) {
      if (data.isNotEmpty) topicList.addAll(data);
      _page++;
      update();
    });
  }

  onRefresh() {
    _page = 1;
    topicList.clear();
    _fetchTopicData();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _fetchTopicData();
    }
  }
}
