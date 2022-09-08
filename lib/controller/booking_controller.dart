import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tartan/model/booking.dart';
import 'package:tartan/utils/colours.dart';

String token = 'Bearer ${GetStorage().read('token')}';

class BookingController extends GetxController {
  @override
  void onInit() {
    if (GetStorage().read('yardID') != null) {
      getBookings(GetStorage().read('yardID'));
      getAcceptedBookings(GetStorage().read('yardID'));
      getRejectedBookings(GetStorage().read('yardID'));
    }
    super.onInit();
  }

  List<Booking> fieldBookingsList = [];
  List<Booking> fieldAcceptedBookingsList = [];
  List<Booking> fieldRejectedBookingsList = [];

  Future<void> getBookings(String yardID) async {
    String bookingUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/booking/yards/pending/$yardID";
    http.Response response = await http.get(
      Uri.parse(bookingUrl),
      headers: {
        "accept": "text/plain",
        'authorization': token,
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      try {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          fieldBookingsList.add(Booking.fromMap(data[i]));
        }
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 404) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar('', details, colorText: Colurs.white);
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
    update();
  }

  Future<void> getAcceptedBookings(String yardID) async {
    String bookingUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/booking/yards/accepted/$yardID";
    http.Response response = await http.get(
      Uri.parse(bookingUrl),
      headers: {
        "accept": "text/plain",
        'authorization': token,
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      try {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          fieldAcceptedBookingsList.add(Booking.fromMap(data[i]));
        }
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 404) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar('', details, colorText: Colurs.white);
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
    update();
  }

  Future<void> getRejectedBookings(String yardID) async {
    String bookingUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/booking/yards/rejected/$yardID";
    http.Response response = await http.get(
      Uri.parse(bookingUrl),
      headers: {
        "accept": "text/plain",
        'authorization': token,
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      try {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          fieldRejectedBookingsList.add(Booking.fromMap(data[i]));
        }
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 404) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar('', details, colorText: Colurs.white);
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
    update();
  }

  Future<void> setBooking(String yardID, String bookingDate) async {
    debugPrint(GetStorage().read('token'));

    var bookBody = json.encode({"booking_date": bookingDate});
    String bookingUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/booking/yards/$yardID";
    http.Response response = await http.post(Uri.parse(bookingUrl),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
        body: bookBody);
    if (response.statusCode == 201) {
      Get.snackbar('تم الحجز', 'انتظر الموافقة من صاحب الملعب',
          colorText: Colurs.white);
    } else if (response.statusCode == 400) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar('', details, colorText: Colurs.white);
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
    update();
  }

  Future bookingStatus(String statusID, String bookingStatus, bool isSuccess,
      bool isAvail) async {
    var bookBody = json.encode({
      "booking_status": bookingStatus,
      "is_success": isSuccess,
      "is_avail": isAvail,
    });
    String bookingUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/booking/bookingStatus?bs_id=$statusID";
    http.Response response = await http.put(Uri.parse(bookingUrl),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
        body: bookBody);
    if (response.statusCode == 500) {
      Get.snackbar('', 'تم تنفيذ العملية', colorText: Colurs.white);
      fieldBookingsList = [];
      fieldAcceptedBookingsList = [];
      getBookings(GetStorage().read('yardID'));
      getAcceptedBookings(GetStorage().read('yardID'));
    } else if (response.statusCode == 400) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar('', details, colorText: Colurs.white);
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
    update();
  }
}
