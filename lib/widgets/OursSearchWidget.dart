import 'package:flutter/material.dart';

class OursSearchWidget extends StatelessWidget {
  const OursSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xffE68E8F)),
      child: Center(
        child: Icon(
          Icons.search,
          color: Color(0xFFBE4749),
        ),
      ),
    );
  }
}
