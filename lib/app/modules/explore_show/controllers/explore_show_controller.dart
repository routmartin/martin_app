import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/modules/explore_show/api/explore_show_api.dart';

enum Status { loading, noMore, loaded }

class ExploreShowController extends GetxController {
  final ExploreShowApi _exploreShowApi = Get.find();
  List<Photo> photoCollectionList = [];
  int page = 1;
  Status loadingStatus = Status.loading;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListiner);
  }

  @override
  void onReady() {
    super.onReady();
    _fetchExploreShowData();
  }

  _fetchExploreShowData() {
    if (photoCollectionList.length < Get.arguments[2]) {
      _exploreShowApi
          .fetchExploreCollection(page: page, collectionId: Get.arguments[0])
          .then((data) {
        if (data.isNotEmpty) {
          photoCollectionList.addAll(data);
          page++;
          update();
        }
      });
    } else {
      loadingStatus = Status.noMore;
      update();
    }
  }

  onRefresh() {
    loadingStatus = Status.loading;
    photoCollectionList.clear();
    page = 1;
    _fetchExploreShowData();
  }

  _scrollListiner() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) _fetchExploreShowData();
  }
}
