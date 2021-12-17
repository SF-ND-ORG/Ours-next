import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/data/OursPostData.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';

class OursMainPageState {
  // title
  final _title = "2233".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
