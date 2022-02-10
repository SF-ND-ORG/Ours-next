import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

import 'index.dart';

class OursMergeMusicPage extends GetView<OursMergeMusicPageController> {
  const OursMergeMusicPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: OursColorMainRed,
            shadowColor: OursColorStandOutRed,
          ),
          body: Material(
              color: OursColorBrightGray,
              child: ListView(
                children: [
                  TextField(
                    onSubmitted: controller.onSearch,
                  ),
                  Obx(() => Material(
                        color: Colors.transparent,
                        child: Column(
                            children: controller.state.searchResult.isEmpty
                                ? <Widget>[]
                                : controller.state.searchResult
                                    .map(
                                      (element) => InkWell(
                                          onTap: () {
                                            Get.find<OursMusicController>()
                                                .playSong(element);
                                          },
                                          child: Container(
                                              constraints:
                                                  BoxConstraints(maxHeight: 45),
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 10, 20, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: 300),
                                                    child: Text(
                                                      element.name == null
                                                          ? ''
                                                          : element.name!,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        element.artist == null
                                                            ? ''
                                                            : " - " +
                                                                element
                                                                    .artist![0],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              OursColorMainRed,
                                                        )),
                                                  ),
                                                  Spacer(),
                                                  IconButton(
                                                      onPressed: () {
                                                        Get.find<
                                                                OursMusicController>()
                                                            .addSong(element);
                                                      },
                                                      padding: EdgeInsets.zero,
                                                      color: OursColorMainRed,
                                                      icon: Icon(Icons.add)),
                                                ],
                                              ))),
                                    )
                                    .toList()),
                      ))
                ],
              ))),
    );
  }
}
