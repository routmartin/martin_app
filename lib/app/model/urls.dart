import 'dart:convert';

class Urls {
  Urls({this.full, this.regular, this.small, this.raw});

  String regular;
  String small;
  String full;
  String raw;

  factory Urls.fromRawJson(String str) => Urls.fromJson(json.decode(str));

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        raw: json["raw"],
      );
}
