import 'package:get/get.dart';

import 'field_controller.dart';
import 'register_controller.dart';

class Bind implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(FieldController());
  }
}
