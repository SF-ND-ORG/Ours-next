import 'package:ours_next/common/utils/utils.dart';
import 'package:ours_next/data/OursPostListResponseEntity.dart';

class OursPostsAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<OursPostListResponseEntity> getOursPostsList() async {
    print("Get posts started.");
    var response = await HttpUtil().get(
      '/posts/',
    );
    print("Get posts finished.");
    return OursPostListResponseEntity.fromJson(response);
  }
}
