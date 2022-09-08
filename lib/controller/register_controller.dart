import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tartan/utils/colours.dart';
import 'package:tartan/view/landing_page.dart';

class MainController extends GetxController {
  Future<void> registerUser({
    required String fullName,
    required int age,
    required String phoneNumber,
    required String password1,
    required String password2,
  }) async {
    var registerBody = json.encode({
      "full_name": fullName,
      "age": age,
      "phone_number": phoneNumber,
      "password1": password1,
      "password2": password2,
    });
    String registerUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/products/signup";
    http.Response response = await http.post(Uri.parse(registerUrl),
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        },
        body: registerBody);
    if (response.statusCode == 201) {
      try {
        String data = response.body;
        var token = jsonDecode(data)['token']['access'];
        var account = jsonDecode(data)['account'];
        fullName = account["full_name"];
        phNumber = account["phone_number"];
        age = account["age"];
        address = account["address"];

        GetStorage().write("token", token);
        GetStorage().write("full_name", fullName);
        GetStorage().write("phNumber", phNumber);
        GetStorage().write("age", age);
        GetStorage().write("address", address);

        Get.offAll(() => const LandingPage());
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 400) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar(details, '');
    } else if (response.statusCode == 422) {
      var details = jsonDecode(response.body)['detail']['msg'];
      // print(details);
      Get.snackbar(details, '');
    } else {
      // print('Response : ${response.reasonPhrase}');
      // print('Response : ${response.statusCode}');
    }
    update();
  }

  late String fullName;
  late String phNumber;
  bool isOwner = false;
  late int age;
  String? address;
  String? yardID;
  Future<void> loginUser(String phoneNumber, String password) async {
    var loginBody =
        json.encode({"phone_number": phoneNumber, "password": password});
    String loginUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/products/signin";
    http.Response response = await http.post(Uri.parse(loginUrl),
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        },
        body: loginBody);
    if (response.statusCode == 200) {
      try {
        String data = response.body;
        var token = jsonDecode(data)['token']['access'];
        var account = jsonDecode(data)['account'];
        fullName = account["full_name"];
        phNumber = account["phone_number"];
        age = account["age"];
        address = account["address"];
        GetStorage().write("token", token);
        isOwner = account["is_owner"];
        if (isOwner) {
          yardID = account["yard"]['id'];
          GetStorage().write("yardID", yardID);
        }
        GetStorage().write("full_name", fullName);
        GetStorage().write("phNumber", phNumber);
        GetStorage().write("age", age);
        GetStorage().write("address", address);
        GetStorage().write("isOwner", isOwner);
        debugPrint(GetStorage().read('token'));
        Get.offAll(() => const LandingPage());
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 404) {
      var details = jsonDecode(response.body)['detail'];
      Get.snackbar(
        '',
        details,
        colorText: Colurs.white,
      );
    } else {
      // print('Response : ${response.reasonPhrase}');
    }
  }
}
