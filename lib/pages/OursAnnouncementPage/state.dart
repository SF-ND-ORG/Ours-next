import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/data/OursAnnouncementEntity.dart';
import 'package:ours_next/widgets/announcement/OursAnnouncementCardWidget.dart';

class OursAnnouncementPageState {
  // 通知列表
  var _announcementlist = Rx<List<OursAnnouncementEntity>?>(null);
  set announcementlist(value) => _announcementlist.value = value;
  get announcementlist => _announcementlist.value;
}
