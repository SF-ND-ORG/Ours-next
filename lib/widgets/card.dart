import 'package:flutter/material.dart';
import 'package:ours_next/OursTheme.dart';

class OursCard extends StatefulWidget {
  const OursCard({Key? key}) : super(key: key);

  @override
  _OursCardState createState() => _OursCardState();
}

class _OursCardState extends State<OursCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: OursColorBrightGray,
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              offset: (Offset(0, 5)),
              blurRadius: 20,
              spreadRadius: -20),
          normalShadow1
        ],
      ),
    );
  }
}
