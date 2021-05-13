import 'dart:convert';
import 'urls.dart';

class Collection {
  Collection(
      {this.id,
      this.title,
      this.description,
      this.previewPhotos,
      this.totalPhoto});

  String id;
  String title;
  String description;
  int totalPhoto;
  List<PreviewPhoto> previewPhotos;

  factory Collection.fromRawJson(String str) =>
      Collection.fromJson(json.decode(str));

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        totalPhoto: json["total_photos"],
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
      );
}

class PreviewPhoto {
  PreviewPhoto({
    this.urls,
    this.id,
  });

  Urls urls;
  String id;

  factory PreviewPhoto.fromRawJson(String str) =>
      PreviewPhoto.fromJson(json.decode(str));

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        urls: Urls.fromJson(
          json["urls"],
        ),
        id: json["id"] == null ? null : json["id"],
      );
}
