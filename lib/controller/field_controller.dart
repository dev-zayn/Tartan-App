import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:tartan/model/fav_fields.dart';
import 'package:tartan/model/field_images.dart';
import 'package:tartan/model/fields.dart';
import 'package:tartan/utils/colours.dart';

String token = 'Bearer ${GetStorage().read('token')}';

class FieldController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getFields();
    getFavFields();
  }

  List<Fields> fieldList = [];
  List<FavFields> favList = [];
  List<FieldImages> fieldImagesList = [];

  Future getFields() async {
    try {
      http.Response response = await http.get(
          Uri.parse("https://iamm0stafamoh.pythonanywhere.com/api/yards/yards"),
          headers: {
            "accept": "text/plain",
            "Content-Type": "application/json",
          });

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          fieldList.add(Fields.fromMap(data[i]));
        }
        update();
      } else {
        // print('status code = ${response.statusCode}');
      }
    } catch (e) {
      // print(e.toString());
    }
    update();
  }

  Future getFavFields() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://iamm0stafamoh.pythonanywhere.com/api/favorites/is_fav"),
          headers: {
            "accept": "text/plain",
            'authorization': token,
            "Content-Type": "application/json",
          });

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          favList.add(FavFields.fromMap(data[i]));
        }
      } else if (response.statusCode == 400) {
        var details = jsonDecode(response.body)['detail'];
        Get.snackbar('', details, colorText: Colurs.white);
      } else {
        // print('status code = ${response.statusCode}');
      }
    } catch (e) {
      // print(e.toString());
    }
    update();
  }

  Future setFieldFav(String yardId) async {
    try {
      debugPrint(GetStorage().read('token'));
      http.Response response = await http.post(
        Uri.parse(
          "https://iamm0stafamoh.pythonanywhere.com/api/favorites/is_fav/$yardId",
        ),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        try {
          String data = response.body;
          bool isFieldFav = jsonDecode(data)['is_fav'];
          String yardId = jsonDecode(data)['yard']['id'];
          String yardName = jsonDecode(data)['yard']['name'];
          GetStorage().write(yardId, isFieldFav);
          if (isFieldFav) {
            Get.snackbar('', 'تم اضافة $yardName للمفضلات',
                colorText: Colurs.white,
                shouldIconPulse: false,
                icon: Icon(
                  Iconsax.tick_circle,
                  color: Colurs.lightGreen,
                ));
          } else {
            Get.snackbar('', 'تم حذف $yardName من المفضلات',
                colorText: Colurs.white,
                shouldIconPulse: false,
                icon: Icon(
                  Iconsax.tick_circle,
                  color: Colurs.lightGreen,
                ));
          }
          favList = [];
          getFavFields();
          getFavField(yardId);
        } on Exception catch (exception) {
          // print(exception);
        } catch (error) {
          // print(error);
        }
      } else if (response.statusCode == 400) {
        var details = jsonDecode(response.body)['detail'];
        Get.snackbar('', details, colorText: Colurs.white);
      } else {
        debugPrint('fetch else');
        debugPrint('token $token');
        debugPrint(
            'Response : ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      // print(e.toString());
    }
    update();
  }

  Future getFavField(String yardId) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "https://iamm0stafamoh.pythonanywhere.com/api/favorites/is_fav/$yardId",
        ),
        headers: {
          "accept": "text/plain",
          'authorization': token,
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        try {
          String data = response.body;
          bool isFieldFav = jsonDecode(data)['is_fav'];
          String yardId = jsonDecode(data)['yard']['id'];
          GetStorage().write(yardId, isFieldFav);
        } on Exception catch (exception) {
          debugPrint(exception.toString());
        } catch (error) {
          debugPrint(error.toString());
        }
      } else if (response.statusCode == 400) {
        var details = jsonDecode(response.body)['detail'];
        Get.snackbar('', details, colorText: Colurs.white);
      } else {
        debugPrint('fetch else');

        debugPrint(
            'Response : ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      // print(e.toString());
    }
    update();
  }

  Future getFieldImages(String yardId) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              "https://iamm0stafamoh.pythonanywhere.com/api/images/yards/$yardId"),
          headers: {
            "accept": "text/plain",
            'authorization': token,
            "Content-Type": "application/json",
          });

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          fieldImagesList.add(FieldImages.fromMap(data[i]));
        }
      } else if (response.statusCode == 400) {
        var details = jsonDecode(response.body)['detail'];
        Get.snackbar('', details, colorText: Colurs.white);
      } else {
        // print('status code = ${response.statusCode}');
      }
    } catch (e) {
      // print(e.toString());
    }
    update();
  }
}
