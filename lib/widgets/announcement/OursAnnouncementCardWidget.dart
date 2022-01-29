import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ours_next/data/OursAnnouncementEntity.dart';
import 'package:ours_next/pages/OursAnnouncementDetailPage/OursAnnouncementDetailPage.dart';
import 'package:ours_next/widgets/OursCardWidget.dart';

class OursAnnouncementCardWidget extends StatelessWidget {
  const OursAnnouncementCardWidget(
      {Key? key, this.announcementdata = const OursAnnouncementEntity()})
      : super(key: key);

  final OursAnnouncementEntity announcementdata;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
              () => OursAnnouncementDetailPage(
                  announcementData: this.announcementdata),
              curve: Curves.easeInOutQuad,
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 250),
              arguments: announcementdata.id);
        },
        child: OursCardWidget(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                announcementdata.title,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "SourceHanSerif",
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                announcementdata.author,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                announcementdata.content,
                style: TextStyle(fontFamily: "SourceHanSerif"),
              )
            ],
          ),
        ));
  }
}
