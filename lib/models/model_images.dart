class PhotosModel {
  String webformatURL;
  String largeImageURL;

  PhotosModel({required this.webformatURL,required this.largeImageURL});

  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) =>
      _commentFromJson(json);

  Map<dynamic, dynamic> toJson() => photosModelToJson(this);
}

PhotosModel _commentFromJson(Map<dynamic, dynamic> json) {
  return PhotosModel(
    webformatURL: json['webformatURL'],
    largeImageURL:json['largeImageURL']
  );
}

Map<dynamic, dynamic> photosModelToJson(PhotosModel instance) =>
    <dynamic, dynamic>{
      'webformatURL': instance.webformatURL,
      'largeImageURL':instance.largeImageURL
    };


// // To parse this JSON data, do
// //
// //     final image = imageFromJson(jsonString);

// import 'dart:convert';

// Image imageFromJson(String str) => Image.fromJson(json.decode(str));

// String imageToJson(Image data) => json.encode(data.toJson());

// class Image {
//     Image({
//         this.total,
//         this.totalHits,
//         this.hits,
//     });

//     int? total;
//     int? totalHits;
//     List<Hit>? hits;

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         total: json["total"],
//         totalHits: json["totalHits"],
//         hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "total": total,
//         "totalHits": totalHits,
//         "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
//     };
// }

// class Hit {
//     Hit({
//         this.id,
//         this.pageUrl,
//         this.type,
//         this.tags,
//         this.webformatURL,
//         this.previewWidth,
//         this.previewHeight,
//         this.webformatURL,
//         this.webformatWidth,
//         this.webformatHeight,
//         this.webformatURL,
//         this.imageWidth,
//         this.imageHeight,
//         this.imageSize,
//         this.views,
//         this.downloads,
//         this.collections,
//         this.likes,
//         this.comments,
//         this.userId,
//         this.user,
//         this.userImageUrl,
//     });

//     int? id;
//     String? pageUrl;
//     Type? type;
//     String? tags;
//     String? webformatURL;
//     int? previewWidth;
//     int? previewHeight;
//     String? webformatURL;
//     int? webformatWidth;
//     int?webformatHeight;
//     String? webformatURL;
//     int? imageWidth;
//     int? imageHeight;
//     int? imageSize;
//     int? views;
//     int? downloads;
//     int? collections;
//     int? likes;
//     int? comments;
//     int? userId;
//     String? user;
//     String? userImageUrl;

//     factory Hit.fromJson(Map<String, dynamic> json) => Hit(
//         id: json["id"],
//         pageUrl: json["pageURL"],
//         type: typeValues.map[json["type"]],
//         tags: json["tags"],
//         webformatURL: json["webformatURL"],
//         previewWidth: json["previewWidth"],
//         previewHeight: json["previewHeight"],
//         webformatURL: json["webformatURL"],
//         webformatWidth: json["webformatWidth"],
//         webformatHeight: json["webformatHeight"],
//         webformatURL: json["webformatURL"],
//         imageWidth: json["imageWidth"],
//         imageHeight: json["imageHeight"],
//         imageSize: json["imageSize"],
//         views: json["views"],
//         downloads: json["downloads"],
//         collections: json["collections"],
//         likes: json["likes"],
//         comments: json["comments"],
//         userId: json["user_id"],
//         user: json["user"],
//         userImageUrl: json["userImageURL"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "pageURL": pageUrl,
//         "type": typeValues.reverse[type],
//         "tags": tags,
//         "webformatURL": webformatURL,
//         "previewWidth": previewWidth,
//         "previewHeight": previewHeight,
//         "webformatURL": webformatURL,
//         "webformatWidth": webformatWidth,
//         "webformatHeight": webformatHeight,
//         "webformatURL": webformatURL,
//         "imageWidth": imageWidth,
//         "imageHeight": imageHeight,
//         "imageSize": imageSize,
//         "views": views,
//         "downloads": downloads,
//         "collections": collections,
//         "likes": likes,
//         "comments": comments,
//         "user_id": userId,
//         "user": user,
//         "userImageURL": userImageUrl,
//     };
// }

// enum Type { PHOTO }

// final typeValues = EnumValues({
//     "photo": Type.PHOTO,
//     "reverse":
  
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map,this.reverseMap);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
           
//         } return reverseMap;
//     }}