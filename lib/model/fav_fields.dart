// To parse this JSON data, do
//
//     final favFields = favFieldsFromMap(jsonString);

import 'dart:convert';

List<FavFields> favFieldsFromMap(String str) =>
    List<FavFields>.from(json.decode(str).map((x) => FavFields.fromMap(x)));

String favFieldsToMap(List<FavFields> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FavFields {
  FavFields({
    required this.isFav,
    required this.yard,
  });

  bool isFav;
  Yard yard;

  factory FavFields.fromMap(Map<String, dynamic> json) => FavFields(
        isFav: json["is_fav"],
        yard: Yard.fromMap(json["yard"]),
      );

  Map<String, dynamic> toMap() => {
        "is_fav": isFav,
        "yard": yard.toMap(),
      };
}

class Yard {
  Yard({
    required this.id,
    required this.name,
    required this.description,
    required this.bookingPrice,
    required this.yardsNumber,
    required this.image,
    required this.address,
    required this.worktime,
    required this.services,
  });

  String id;
  String name;
  String description;
  int bookingPrice;
  int yardsNumber;
  String image;
  Address address;
  Worktime worktime;
  Services services;

  factory Yard.fromMap(Map<String, dynamic> json) => Yard(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        bookingPrice: json["booking_price"],
        yardsNumber: json["yards_number"],
        image: json["image"],
        address: Address.fromMap(json["address"]),
        worktime: Worktime.fromMap(json["worktime"]),
        services: Services.fromMap(json["services"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "booking_price": bookingPrice,
        "yards_number": yardsNumber,
        "image": image,
        "address": address.toMap(),
        "worktime": worktime.toMap(),
        "services": services.toMap(),
      };
}

class Address {
  Address({
    required this.id,
    required this.governorate,
    required this.neighborhood,
    required this.nearestPoint,
  });

  String id;
  String governorate;
  String neighborhood;
  String nearestPoint;

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        governorate: json["governorate"],
        neighborhood: json["neighborhood"],
        nearestPoint: json["nearest_point"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "governorate": governorate,
        "neighborhood": neighborhood,
        "nearest_point": nearestPoint,
      };
}

class Services {
  Services({
    required this.id,
    required this.services,
  });

  String id;
  List<String> services;

  factory Services.fromMap(Map<String, dynamic> json) => Services(
        id: json["id"],
        services: List<String>.from(json["services"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "services": List<dynamic>.from(services.map((x) => x)),
      };
}

class Worktime {
  Worktime({
    required this.id,
    required this.openTime,
    required this.closeTime,
  });

  String id;
  String openTime;
  String closeTime;

  factory Worktime.fromMap(Map<String, dynamic> json) => Worktime(
        id: json["id"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "open_time": openTime,
        "close_time": closeTime,
      };
}
