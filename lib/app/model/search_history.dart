class SearchHistory {
  final int id;
  final String title;

  SearchHistory({this.id, this.title});

  SearchHistory.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
