import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/pages/OursAnnouncementPage/controller.dart';
import 'package:ours_next/widgets/announcement/OursAnnouncementCardWidget.dart';

class OursAnnouncementPageAnnouncementList
    extends GetView<OursAnnouncementPagecontroller> {
  OursAnnouncementPageAnnouncementList();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.state.announcementlist == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: controller.state.announcementlist.map<Widget>((item) {
              return OursAnnouncementCardWidget(
                announcementdata: item,
              );
            }).toList()));
  }
}
