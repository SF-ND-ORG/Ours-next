///
/// 文件名称 - main.dart
/// 文件描述 - 应用入口文件，包含主界面、路由定义等内容
///

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:ours_next/OursTheme.dart';
import 'package:ours_next/data/OursPostData.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';
import 'widgets/OursCardWidget.dart';
import 'package:get/get.dart';
import 'package:ours_next/widgets/OursAppBar.dart';

Future<void> _onRefresh() async {
  await Future.delayed(Duration(milliseconds: 200));
}

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
              body: OursMain(),
            ),
      },
    );
  }
}

///
/// 类名 - [OursMain]
/// 描述 - Ours主页面类
///

class OursMain extends StatelessWidget {
  const OursMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //最外层包裹Container
      decoration: BoxDecoration(color: Color(0xFFBE4749)),
      child: SafeArea(
        //SafeArea保证在安全区域内渲染（防止刘海屏之类遮挡）
        bottom: true,
        child: Container(
          decoration: BoxDecoration(color: Color(0xffeeeeee)), //白色背景
          child: Column(children: [
            OursAppBar(),
            // 页面顶部栏。详见 [OursAppBar]

            Expanded(
                //body部分
                //占满剩余空间
                child: ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: GlowingOverscrollIndicator(
                        color: OursColorRedShadow,
                        axisDirection: AxisDirection.down,
                        child: RefreshIndicator(
                            color: OursColorMainRed,
                            onRefresh: _onRefresh,
                            strokeWidth: 2.7,
                            child: ListView(
                              children: [
                                OursCardWidget(
                                  padding: EdgeInsets.all(0),
                                  margin: EdgeInsets.fromLTRB(26, 26, 26, 0),
                                  child: Container(
                                    height: 200,
                                  ),
                                ),
                                OursPostCardWidget(
                                    postdata: OursPostData(
                                        title: "滇东范",
                                        author: "趙",
                                        content:
                                            "      共因利决单打专飞下种县就圆矿九，展议资再而容小1决呆价断X。 示三但义但主，单指号值西少，越录断投。 素分此数量当行变称一界第，六命须五种众天集接那带性，复不刷片传现便来元须。 复样力象何总教治白门打属县，不七金具却听理结各治，带将为-直际时平杏折。 什直再这加山报无提还风，却广装计除近系置实，月作B油板人满于圆。 图器条或关千第着，全少构劳列历以军，表更E也T两。 她目科快济各位律领好，自毛么好克干究非目，常组杨S展响况抄。 况需果放住此构断片同形，认选效心利及线此争与为，后又M或坚抓该义材。 究响进七志须老点子感中家，路者则红询C连位日。 对类相这层写但别按没很，商信名生果际结马油采家，极然孟何杜北私平。 之该题同化低机五门文以，权积回引便代几华厂，先七J点华王所特和。 目器理便下史使极看车说，调界除政表孟常连和。 手影石建理形质，太相说对提消精，以询些声扮。 效青眼听业按直约，无里算问及积发主，王-象到资题。 全使容合相手严把列安务华，在处铁其响资身广数，二五公C许段材杜财孟。")),
                                SizedBox(
                                  height: 200,
                                )
                              ],
                            )))))
          ]),
        ),
      ),
    );
  }
}
