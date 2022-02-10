import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

import 'controller.dart';

class OursMainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OursMainPageController>(() => OursMainPageController());
    Get.lazyPut<OursMusicController>(() => OursMusicController());
  }
}
