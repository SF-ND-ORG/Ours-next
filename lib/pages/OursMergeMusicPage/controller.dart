import 'package:get/get.dart';
import 'package:ours_next/common/apis/OursMergeMusicApi.dart';
import 'package:ours_next/data/OursMusicSearchEntity.dart';

import 'index.dart';

class OursMergeMusicPageController extends GetxController {
  OursMergeMusicPageController();

  final state = OursMergeMusicPageState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  onSearch(String s) async {
    var result = await OursMergeMusicAPI.search(
        OursMusicSearchRequestEntity(keyword: s));
    state.searchResult.value = result.items ?? [];
  }
}
