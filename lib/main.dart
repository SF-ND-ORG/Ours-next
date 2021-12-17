///
/// 文件名称 - main.dart
/// 文件描述 - 应用入口文件，包含主界面、路由定义等内容
///

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ours_next/pages/OursMainPage/view.dart';
import 'package:get/get.dart';

///
/// 函数名 - [main()]
/// 描述 - Ours主函数
///
main() {
  runApp(OursApp());

  // 沉浸式状态栏
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, //light:亮色状态栏
      systemNavigationBarColor: Colors.transparent);

  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

///
/// 类名 - [OursApp]
/// 描述 - Ours程序类
///

class OursApp extends StatelessWidget {
  const OursApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ours", //App标题
      initialRoute: "/", //起始路由
      routes: {
        //命名路由表
        "/": (context) => Scaffold(
              body: OursMainPage(),
            ),
      },
    );
  }
}

// class OursMainPage extends StatelessWidget {
//   const OursMainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
