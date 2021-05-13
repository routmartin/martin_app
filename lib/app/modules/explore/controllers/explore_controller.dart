import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/collection.dart';
import 'package:martin_app/app/modules/explore/api/explore_api.dart';

class ExploreController extends GetxController {
  final _exploreApi = Get.find<ExploreApi>();

  List<Collection> collectionList = [];

  int _collectionPage = 1;
  bool isCollectionLoading = true;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
    _fetchCollectionData();
  }

  _fetchCollectionData() {
    _exploreApi.fetchExploreCollection(page: _collectionPage).then((data) {
      collectionList.addAll(data);
      isCollectionLoading = false;
      _collectionPage++;
      update();
    });
  }

  onRefresh() {
    _collectionPage = 1;
    collectionList.clear();
    _fetchCollectionData();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _fetchCollectionData();
    }
  }
}
