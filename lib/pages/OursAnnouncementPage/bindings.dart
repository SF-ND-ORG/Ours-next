import 'package:get/get.dart';

import 'controller.dart';

class OursAnnouncementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OursAnnouncementPagecontroller>(
        () => OursAnnouncementPagecontroller());
  }
}
