import 'dart:convert';

List<FieldImages> fieldImagesFromMap(String str) =>
    List<FieldImages>.from(json.decode(str).map((x) => FieldImages.fromMap(x)));

String fieldImagesToMap(List<FieldImages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FieldImages {
  FieldImages({
    required this.id,
    required this.yardimage,
  });

  String id;
  String yardimage;

  factory FieldImages.fromMap(Map<String, dynamic> json) => FieldImages(
        id: json["id"],
        yardimage: json["yardimage"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "yardimage": yardimage,
      };
}
