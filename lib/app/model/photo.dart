import 'dart:convert';

import 'urls.dart';

class Photo {
  Photo({
    this.id,
    this.altDescription,
    this.urls,
  });

  String id;
  String altDescription;
  Urls urls;

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        altDescription: json["alt_description"],
        urls: Urls.fromJson(
          json["urls"],
        ),
      );
}
