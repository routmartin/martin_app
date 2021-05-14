import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/modules/search/api/search_api.dart';

class SearchController extends GetxController {
  final SearchApi _searchApi = Get.find();
  List<Photo> photoList = [];
  int _page = 1;
  bool isLoading = true;
  String query;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    query = "";
    scrollController.addListener(_scrollListener);
  }

  void searchPhoto() async {
    await _searchApi.searchPhoto(page: _page, query: query).then((data) {
      if (data.isNotEmpty) photoList.addAll(data);
      _page++;
      isLoading = false;
      update();
    });
  }

  onRefresh() {
    _page = 1;
    photoList.clear();
    searchPhoto();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      searchPhoto();
    }
  }
}
