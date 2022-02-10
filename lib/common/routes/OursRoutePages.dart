import 'package:ours_next/pages/OursMergeMusicPage/index.dart';

import 'OursRoutes.dart';
import 'package:ours_next/pages/OursMainPage/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      name: AppRoutes.OursMergeMusicPageRouteName,
      page: () => OursMergeMusicPage(),
      binding: OursMergeMusicPageBinding(),
      curve: Curves.easeInOutQuad,
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
    ),
  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.NotFound,
  //   page: () => NotfoundView(),
  // );

}
