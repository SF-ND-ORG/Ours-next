import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';
import 'package:ours_next/common/widgets/MusicPlayerController.dart';
import 'package:ours_next/widgets/OursCardWidget.dart';
import 'package:ours_next/common/widgets/widgets.dart';

class OursMainPageMergeMusic extends GetView<OursMusicController> {
  OursMainPageMergeMusic();

  @override
  Widget build(BuildContext context) {
    return OursCardWidget(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
      child: Material(
        color: Colors.transparent,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Obx(
            () => Slider(
              value: controller.percent.value,
              onChangeStart: (v) {
                controller.isTouch = true;
              },
              onChangeEnd: (v) {
                controller.isTouch = false;
                controller.seekTime((controller.totalTime * v).toInt());
              },
              onChanged: (v) {
                controller.percent.value = v;
                controller.currentTime.value =
                    (controller.totalTime.value * v).toInt();
              },
            ),
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Center(child: ControlButtons(controller.player)),
          )
        ]),
      ),
    );
  }
}
