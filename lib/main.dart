import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:ours_next/OursTheme.dart';
import 'widgets/search.dart';
import 'package:badges/badges.dart';
import 'widgets/card.dart';

Future<void> _onRefresh() async {
  await Future.delayed(Duration(milliseconds: 200));
}

main() {
  runApp(OursApp());

  //todo:沉浸式状态栏
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, //light:亮色状态栏
      systemNavigationBarColor: Colors.transparent);

  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class OursApp extends StatelessWidget {
  const OursApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ours",
        home: Scaffold(
          body: OursMain(),
        ));
  }
}

class OursMain extends StatelessWidget {
  const OursMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFBE4749)),
      child: SafeArea(
        bottom: true,
        child: Container(
          decoration: BoxDecoration(color: Color(0xffeeeeee)),
          child: Column(children: [
            OursAppBar(),
            Expanded(
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
                              children: [
                                OursCard(
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
                                  child: Container(
                                    height: 200,
                                  ),
                                ),
                                SizedBox(
                                  height: 200,
                                )
                              ],
                            )))))
          ]),
        ),
      ),
    );
  }
}

class OursAppBar extends StatefulWidget {
  const OursAppBar({Key? key}) : super(key: key);

  @override
  _OursAppBarState createState() => _OursAppBarState();
}

class _OursAppBarState extends State<OursAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [normalShadow]),
        child: Material(
            color: Color(0xFFBE4749),
            child: Container(
                height: 56,
                decoration: BoxDecoration(color: Color(0xFFBE4749)),
                child: Material(
                    color: Color(0xFFBE4749),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(child: OursSearchWidget()),
                            SizedBox(width: 10),
                            Badge(
                              position: BadgePosition(top: 2, end: 8),
                              badgeColor: Color(0xffE68E8F),
                              child: Center(
                                child: Ink(
                                  decoration:
                                      BoxDecoration(color: Color(0xFFBE4749)),
                                  child: IconButton(
                                    padding: EdgeInsets.all(0),
                                    icon: const Icon(Icons.mail_outline),
                                    iconSize: 32,
                                    color: Color(0xffE68E8F),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )))));
  }
}
