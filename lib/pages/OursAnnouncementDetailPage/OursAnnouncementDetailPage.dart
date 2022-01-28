import 'package:flutter/material.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/data/OursAnnouncementEntity.dart';
import 'package:get/get.dart';

class OursAnnouncementDetailPage extends StatelessWidget {
  const OursAnnouncementDetailPage({Key? key, required this.announcementData})
      : super(key: key);

  final OursAnnouncementEntity announcementData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: OursColorMainRed,
          shadowColor: OursColorStandOutRed,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: OursColorBrightGray,
          child: ListView(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcementData.title,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "SourceHanSerif",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      announcementData.author,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      announcementData.content,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "SourceHanSerif",
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
