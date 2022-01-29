import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';
import 'package:ours_next/pages/OursMainPage/controller.dart';

class OursMainPagePostsList extends GetView<OursMainPageController> {
  OursMainPagePostsList();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.postslist == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: controller.state.postslist.map<Widget>((item) {
              return OursPostCardWidget(
                postdata: item,
              );
            }).toList()));
  }
}
