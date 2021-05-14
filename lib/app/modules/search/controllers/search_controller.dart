import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/search_history.dart';
import 'package:martin_app/app/routes/app_pages.dart';
import 'package:martin_app/app/sqlite/search_history.dart';

class SearchController extends GetxController {
  final SearchHistoryLocalStorage _historyLocalStorage = Get.find();
  String _searchQuery;
  List<SearchHistory> historyCollection = [];

  @override
  void onInit() {
    super.onInit();
    _searchQuery = "";
    loadSearchHistory();
  }

  loadSearchHistory() async {
    historyCollection = await _historyLocalStorage.fetchSearchHistory();
    update();
  }

  goToSearch(String query) async {
    _searchQuery = query;
    if (_searchQuery.isNotEmpty && _searchQuery.length > 0) {
      historyCollection.add(
        SearchHistory(id: 1, title: query),
      );
      _historyLocalStorage.saveSearchHistory(historyCollection);
      Get.toNamed(
        Routes.SEARCH_RESULT,
        arguments: _searchQuery,
      );
    } else {
      Get.snackbar(
        'Please Search Something',
        'Input the word you want to search on Searchbox',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(20),
      );
    }
  }
}
