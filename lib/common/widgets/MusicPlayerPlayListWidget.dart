import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

class MusicPlayerPlayListWidget extends GetWidget<OursMusicController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight: 500),
        child: Obx(() => Material(
              color: Colors.transparent,
              child: ListView(
                  shrinkWrap: true,
                  children: controller.playList.isEmpty
                      ? <Widget>[]
                      : controller.playList
                          .map(
                            (element) => InkWell(
                                onTap: () {
                                  print("Ontap");
                                },
                                child: Container(
                                    constraints: BoxConstraints(maxHeight: 45),
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          element.name == null
                                              ? ''
                                              : element.name!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                            element.artist == null
                                                ? ''
                                                : " - " + element.artist![0],
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: OursColorMainRed,
                                            )),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            padding: EdgeInsets.zero,
                                            color: OursColorMainRed,
                                            icon: Icon(
                                                Icons.delete_outline_rounded)),
                                      ],
                                    ))),
                          )
                          .toList()),
            )));
  }
}
