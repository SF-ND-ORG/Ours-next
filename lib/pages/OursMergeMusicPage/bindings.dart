import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

import 'controller.dart';

class OursMergeMusicPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OursMergeMusicPageController>(
        () => OursMergeMusicPageController());
    Get.lazyPut<OursMusicController>(() => OursMusicController());
  }
}
