import 'OursRoutes.dart';
import 'package:ours_next/pages/OursMainPage/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/pages/OursAnnouncementPage/index.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => OursMainPage(),
      binding: OursMainPageBinding(),
    ),
    GetPage(
      name: AppRoutes.ANNOUNCEMENT,
      page: () => OursAnnouncementPage(),
      binding: OursAnnouncementBinding(),
      curve: Curves.easeInOutQuad,
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 250),
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

}
