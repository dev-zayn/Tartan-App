import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tartan/controller/register_controller.dart';
import 'package:tartan/view/landing_page.dart';
import 'package:tartan/view/registration/login_page.dart';

import 'onboarding.dart';

final box = GetStorage();
MainController mainController = Get.find();
Widget routeChecker() {
  if (box.read('onboarding') != 1) {
    return const OnBoardingPage(
      initial_page: 0,
    );
  } else {
    if (box.read('token') == null || box.read('token') == '') {
      return LoginPage();
    } else {
      return LandingPage();
    }
  }
}
