import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class OursMainPage extends GetView<OursMainPageController> {
  const OursMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OursMainPageController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
