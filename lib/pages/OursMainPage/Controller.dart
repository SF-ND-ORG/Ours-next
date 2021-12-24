import 'package:get/get.dart';
import 'package:ours_next/common/apis/OursApis.dart';

import 'index.dart';

class OursMainPageController extends GetxController {
  OursMainPageController();

  final state = OursMainPageState();

  // 下拉刷新
  Future<void> onRefresh() async {
    await asyncLoadAllData();
  }

  // 拉取数据
  asyncLoadAllData() async {
    state.postslist =
        await OursPostsAPI.getOursPostsList().then((value) => value.items);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
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
}
