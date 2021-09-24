import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ours_next/data/OursPostData.dart';
import 'package:ours_next/widgets/OursCardWidget.dart';

class OursPostCardWidget extends StatelessWidget {
  const OursPostCardWidget({Key? key, this.postdata = const OursPostData()})
      : super(key: key);

  final OursPostData postdata;

  @override
  Widget build(BuildContext context) {
    return OursCardWidget(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postdata.title,
            style: TextStyle(
                fontSize: 24,
                fontFamily: "SourceHanSerif",
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            postdata.author,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            postdata.content,
            style: TextStyle(fontFamily: "SourceHanSerif"),
          )
        ],
      ),
    );
  }
}
