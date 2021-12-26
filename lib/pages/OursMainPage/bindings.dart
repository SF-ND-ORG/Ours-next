import 'package:get/get.dart';

import 'controller.dart';

class OursMainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OursMainPageController>(() => OursMainPageController());
  }
}
