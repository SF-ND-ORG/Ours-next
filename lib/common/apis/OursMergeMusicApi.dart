import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ours_next/common/utils/utils.dart';
import 'package:ours_next/data/OursMusicSearchEntity.dart';
import 'package:ours_next/data/OursPostListResponseEntity.dart';
import 'package:ours_next/data/OursSong.dart';

class OursMergeMusicAPI {
  static Future<OursMusicSearchResponseEntity> search(
      OursMusicSearchRequestEntity searchRequestEntity) async {
    var response = await HttpUtil().get(
        'https://1426531544223608.cn-hangzhou.fc.aliyuncs.com/2016-08-15/proxy/music.LATEST/search/',
        queryParameters: {
          "platform": searchRequestEntity.platform,
          "keyword": searchRequestEntity.keyword,
          "type": searchRequestEntity.type,
          "offset": searchRequestEntity.offset,
          "limit": searchRequestEntity.limit,
        });
    return OursMusicSearchResponseEntity.fromJson(json.decode(response));
  }
}
