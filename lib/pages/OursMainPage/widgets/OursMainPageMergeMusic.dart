import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/common/routes/OursRouteNames.dart';
import 'package:ours_next/common/services/OursMusicService.dart';
import 'package:ours_next/common/utils/utils.dart';
import 'package:ours_next/common/widgets/MusicPlayerControlWidget.dart';
import 'package:ours_next/common/widgets/MusicPlayerPlayListWidget.dart';
import 'package:ours_next/widgets/OursCardWidget.dart';
import 'package:ours_next/common/widgets/widgets.dart';

class OursMainPageMergeMusic extends GetView<OursMusicController> {
  OursMainPageMergeMusic();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "聚合音乐",
        style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontFamily: "SourceHanSerif",
            fontWeight: FontWeight.w800),
      ).marginOnly(left: 36, top: 20, bottom: 20),
      OursCardWidget(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        margin: EdgeInsets.fromLTRB(26, 0, 26, 0),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(
              AppRoutes.OursMergeMusicPageRouteName,
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(children: [
                        Text(
                          formatTime(controller.currentTime.value.toDouble()),
                          style: TextStyle(fontSize: 10),
                        ),
                        Expanded(
                          child: Slider(
                            thumbColor: OursColorBrightStandOutRed,
                            activeColor: OursColorMainRed,
                            inactiveColor: OursColorStandOutRed,
                            value: controller.percent.value,
                            onChangeStart: (v) {
                              controller.isTouch = true;
                            },
                            onChangeEnd: (v) {
                              controller.isTouch = false;
                              controller
                                  .seekTime((controller.totalTime * v).toInt());
                            },
                            onChanged: (v) {
                              controller.percent.value = v;
                              controller.currentTime.value =
                                  (controller.totalTime.value * v).toInt();
                            },
                          ),
                        ),
                        Text(
                          formatTime(controller.totalTime.value.toDouble()),
                          style: TextStyle(fontSize: 10),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(child: MusicPlayerControlWidget()),
                  ),
                  Divider(),
                  MusicPlayerPlayListWidget()
                ]),
          ),
        ),
      )
    ]);
  }
}
