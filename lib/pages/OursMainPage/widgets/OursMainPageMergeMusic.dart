import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/common/services/OursMusicService.dart';
import 'package:ours_next/common/utils/utils.dart';
import 'package:ours_next/common/widgets/MusicPlayerControllWidget.dart';
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
            fontSize: 24,
            fontFamily: "SourceHanSerif",
            fontWeight: FontWeight.w800),
      ).marginOnly(left: 36, top: 30),
      OursCardWidget(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
        child: Material(
          color: Colors.transparent,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => Row(children: [
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
                SizedBox(
                  height: 100,
                  child: Center(child: MusicPlayerControllWidget()),
                )
              ]),
        ),
      )
    ]);
  }
}
