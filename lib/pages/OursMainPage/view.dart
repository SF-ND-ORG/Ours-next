import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/data/OursPostEntity.dart';
import 'package:ours_next/widgets/OursAppBar.dart';
import 'package:ours_next/widgets/OursCardWidget.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';

import 'index.dart';

Future<void> _onRefresh() async {
  await Future.delayed(Duration(milliseconds: 200));
}

class OursMainPage extends GetView<OursMainPageController> {
  const OursMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //最外层包裹Container
            decoration: BoxDecoration(color: Color(0xFFBE4749)),
            child: SafeArea(
                //SafeArea保证在安全区域内渲染（防止刘海屏之类遮挡）
                bottom: true,
                child: Container(
                  decoration: BoxDecoration(color: Color(0xffeeeeee)), //白色背景
                  child: Column(children: [
                    OursAppBar(),
                    Expanded(
                        //body部分
                        //占满剩余空间
                        child: ScrollConfiguration(
                            behavior: ScrollBehavior(),
                            child: GlowingOverscrollIndicator(
                                color: OursColorRedShadow,
                                axisDirection: AxisDirection.down,
                                child: RefreshIndicator(
                                    color: OursColorMainRed,
                                    onRefresh: _onRefresh,
                                    strokeWidth: 2.7,
                                    child: ListView(
                                      children: [],
                                    )))))
                  ]),
                ))));
  }
}