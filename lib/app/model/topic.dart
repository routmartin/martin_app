import 'dart:convert';

class Topic {
  Topic({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.totalPhotos,
    this.previewPhotos,
  });

  String id;
  String slug;
  String title;
  String description;
  int totalPhotos;
  List<PreviewPhoto> previewPhotos;

  factory Topic.fromJson(String str) => Topic.fromMap(json.decode(str));

  factory Topic.fromMap(Map<String, dynamic> json) => Topic(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        totalPhotos: json["total_photos"],
        previewPhotos: List<PreviewPhoto>.from(
          json["preview_photos"].map(
            (x) => PreviewPhoto.fromMap(x),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "title": title,
        "description": description,
        "total_photos": totalPhotos,
        "preview_photos":
            List<dynamic>.from(previewPhotos.map((x) => x.toMap())),
      };
}

class PreviewPhoto {
  PreviewPhoto({
    this.urls,
  });

  ProfileImage urls;

  factory PreviewPhoto.fromJson(String str) =>
      PreviewPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PreviewPhoto.fromMap(Map<String, dynamic> json) => PreviewPhoto(
        urls: ProfileImage.fromMap(json["urls"]),
      );

  Map<String, dynamic> toMap() => {
        "urls": urls.toMap(),
      };
}

class ProfileImage {
  ProfileImage({
    this.small,
  });

  String small;

  factory ProfileImage.fromJson(String str) =>
      ProfileImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
      };
}
