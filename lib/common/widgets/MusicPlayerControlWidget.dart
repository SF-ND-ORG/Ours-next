import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/common/services/OursMusicService.dart';

class MusicPlayerControlWidget extends GetWidget<OursMusicController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => IconButton(
                iconSize: 48,
                onPressed: controller.onPlayPauseButton,
                icon: Icon(controller.playing.value
                    ? Icons.pause
                    : Icons.play_arrow))),
            IconButton(
                iconSize: 48,
                onPressed: controller.nextSong,
                icon: Icon(Icons.skip_next_sharp)),
          ],
        ));
  }
}
