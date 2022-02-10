import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/pages/OursMainPage/controller.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';

class OursMainPagePostsList extends GetView<OursMainPageController> {
  OursMainPagePostsList();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Widget> columnChildren = controller.state.postslist == null
          ? <Widget>[]
          : controller.state.postslist.map<Widget>((item) {
              return OursPostCardWidget(
                postdata: item,
              );
            }).toList();
      columnChildren.insert(
        0,
        Text(
          "文",
          style: TextStyle(
              fontSize: 24,
              fontFamily: "SourceHanSerif",
              fontWeight: FontWeight.w800),
        ).marginOnly(left: 36, top: 20),
      );
      return controller.state.postslist == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: columnChildren);
    });
  }
}
