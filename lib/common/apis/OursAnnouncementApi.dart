import 'package:ours_next/common/utils/utils.dart';
import 'package:ours_next/data/OursAnnouncementEntity.dart';
import 'package:ours_next/data/OursAnnouncementListResponseEntity.dart';

class OursAnnouncementAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<OursAnnouncementListResponseEntity>
      getOursAnnouncementList() async {
    print("Get Announcement started.");
    var response = await HttpUtil().get(
      '/announcement/',
    );
    print("Get announcement finished.");
    return OursAnnouncementListResponseEntity.fromJson(response);
  }
}
