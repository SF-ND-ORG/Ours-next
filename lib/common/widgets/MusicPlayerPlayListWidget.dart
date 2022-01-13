import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

class MusicPlayerPlayListWidget extends GetWidget<OursMusicController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
          color: Colors.transparent,
          child: ListView(
              shrinkWrap: true,
              children: controller.playList.isEmpty
                  ? <Widget>[]
                  : controller.playList
                      .map(
                        (element) => Text(element.name),
                      )
                      .toList()),
        ));
  }
}
