import 'package:flutter/material.dart';
import 'package:ours_next/OursTheme.dart';

class OursCardWidget extends StatelessWidget {
  const OursCardWidget({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Widget child;

  final EdgeInsetsGeometry? padding;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: this.child,
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
