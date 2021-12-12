import 'package:get/get.dart';

import 'controller.dart';

class OursmainpageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OursMainPageController>(() => OursMainPageController());
  }
}
