import 'package:json_store/json_store.dart';
import 'package:martin_app/app/model/search_history.dart';

class SearchHistoryLocalStorage {
  Future<List<SearchHistory>> fetchSearchHistory() async {
    List<SearchHistory> historyCollection = [];
    Map<String, dynamic> json = await JsonStore().getItem('searchHistory');

    historyCollection = json != null
        ? json['value'].map<SearchHistory>((messageJson) {
            return SearchHistory.fromJson(messageJson);
          }).toList()
        : [];

    return historyCollection;
  }

  saveSearchHistory(List<SearchHistory> searchHistory) async {
    await JsonStore().setItem('searchHistory', {
      'value': searchHistory.map((searchHistory) {
        return searchHistory.toJson();
      }).toList()
    });
  }

  deleteSaveHistory() async {
    await JsonStore().deleteLike('searchHistory-%');
  }
}
