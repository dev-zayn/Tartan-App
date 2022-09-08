import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PasswordController extends GetxController {
  var token = 'Bearer ${GetStorage().read('token')}';
  Future<void> passwordChange({
    required String oldPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    var registerBody = json.encode({
      "old_password": oldPassword,
      "new_password1": newPassword1,
      "new_password2": newPassword2,
    });
    String registerUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/products/change-password";
    http.Response response = await http.post(Uri.parse(registerUrl),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
        body: registerBody);
    if (response.statusCode == 200) {
      try {
        String data = response.body;
        var detail = jsonDecode(data)['detail'];
        Get.back();
        Get.snackbar('', detail);
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 400) {
      String data = response.body;
      var detail = jsonDecode(data)['detail'];
      Get.snackbar('', detail);
    } else {
      // print('Response : ${response.reasonPhrase}');
      // print('Response : ${response.statusCode}');
      // print('Response : ${GetStorage().read('token')}');
    }
    update();
  }

  Future<void> updateAccount({
    required String fullName,
    required String phoneNumber,
    required int age,
    required String address,
  }) async {
    var registerBody = json.encode({
      "full_name": fullName,
      "phone_number": phoneNumber,
      "age": age,
      "address": address,
    });
    String registerUrl =
        "https://iamm0stafamoh.pythonanywhere.com/api/products";
    http.Response response = await http.put(Uri.parse(registerUrl),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
        body: registerBody);
    if (response.statusCode == 200) {
      try {
        String data = response.body;
        var detail = jsonDecode(data)['detail'];
        // print(detail);
        GetStorage().write("full_name", fullName);
        GetStorage().write("phNumber", phoneNumber);
        GetStorage().write("age", age);
        GetStorage().write("address", address);
        Get.back();
        Get.snackbar('', detail);
      } on Exception catch (exception) {
        // print(exception);
      } catch (error) {
        // print(error);
      }
    } else if (response.statusCode == 400) {
      String data = response.body;
      var detail = jsonDecode(data)['detail'];
      Get.snackbar('', detail);
    } else {
      // print('Response : ${response.reasonPhrase}');
      // print('Response : ${response.statusCode}');
      // print('Response : ${GetStorage().read('token')}');
    }
    update();
  }
}
