import 'package:flutter/material.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/widgets/OursSearchWidget.dart';
import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:ours_next/common/routes/OursRouteNames.dart';

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
                                    onPressed: () {
                                      Get.toNamed(AppRoutes.ANNOUNCEMENT);
                                    },
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
