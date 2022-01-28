import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/common/services/OursMusicService.dart';
import 'package:ours_next/data/OursSong.dart';

class MusicPlayerPlayListWidget extends GetWidget<OursMusicController> {
  List<Widget> buildPlayList() {
    return controller.playList
        .map((element) => buildPlayListItem(element))
        .toList();
  }

  Widget buildPlayListItem(OursSong item) {
    return InkWell(
        onTap: () {
          controller.toSong(item);
        },
        child: Container(
            constraints: BoxConstraints(maxHeight: 45),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                controller.currentSong.value?.mid == item.mid
                    ? Icon(
                        Icons.play_circle_outlined,
                        color: OursColorMainRed,
                        size: 20,
                      ).marginOnly(right: 5)
                    : Container(),
                Text(
                  item.name == null ? '' : item.name!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(item.artist == null ? '' : " - " + item.artist![0],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: OursColorMainRed,
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {
                      controller.removeSong(item);
                    },
                    padding: EdgeInsets.zero,
                    color: OursColorMainRed,
                    icon: Icon(Icons.delete_outline_rounded)),
              ],
            )));
  }

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
                      : buildPlayList()),
            )));
  }
}
