import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';
import 'package:ours_next/data/OursSong.dart';

class OursMergeMusicPageState {
  get musicController => Get.find<OursMusicController>();

  RxList<OursSong> searchResult = RxList([]);
}
