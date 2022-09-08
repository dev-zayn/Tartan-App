import 'dart:convert';

List<Booking> bookingFromMap(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromMap(x)));

String bookingToMap(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Booking {
  Booking({
    required this.id,
    required this.bookingDate,
    required this.bookingStatus,
    required this.user,
  });

  String id;
  DateTime bookingDate;
  BookingStatus bookingStatus;
  User user;

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
        id: json["id"],
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingStatus: BookingStatus.fromMap(json["booking_status"]),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "booking_date": bookingDate.toIso8601String(),
        "booking_status": bookingStatus.toMap(),
        "user": user.toMap(),
      };
}

class BookingStatus {
  BookingStatus({
    required this.id,
    required this.bookingStatus,
    required this.isSuccess,
    required this.isAvail,
  });

  String id;
  String bookingStatus;
  bool isSuccess;
  bool isAvail;

  factory BookingStatus.fromMap(Map<String, dynamic> json) => BookingStatus(
        id: json["id"],
        bookingStatus: json["booking_status"],
        isSuccess: json["is_success"],
        isAvail: json["is_avail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "booking_status": bookingStatus,
        "is_success": isSuccess,
        "is_avail": isAvail,
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
  });

  String id;
  String fullName;
  String phoneNumber;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "phone_number": phoneNumber,
      };
}
