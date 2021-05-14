import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/modules/search/api/search_api.dart';

class SearchResultController extends GetxController {
  final SearchApi _searchApi = Get.find();

  List<Photo> photoList = [];
  int _page = 1;
  bool isLoading = true;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _fetchSearchPhoto();
    scrollController.addListener(_scrollListener);
  }

  _fetchSearchPhoto() async {
    await _searchApi
        .searchPhoto(page: _page, query: Get.arguments)
        .then((data) {
      if (data.isNotEmpty) {
        photoList.addAll(data);
        _page++;
        isLoading = false;
        update();
      } else {
        print(data);
      }
    });
  }

  onRefresh() {
    _page = 1;
    photoList.clear();
    _fetchSearchPhoto();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) _fetchSearchPhoto();
  }
}
