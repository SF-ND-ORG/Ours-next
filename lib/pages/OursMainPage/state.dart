import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/data/OursPostEntity.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';

class OursMainPageState {
  // 文章列表
  var _postslist = Rx<List<OursPostEntity>?>(null);
  set categories(value) => _postslist.value = value;
  get categories => _postslist.value;
}
