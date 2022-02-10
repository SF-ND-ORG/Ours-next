import 'dart:convert';

import 'package:ours_next/common/utils/http.dart';

class OursSong {
  String? type;
  String? mid;
  String? name;
  List<String>? artist;
  Album? album;

  OursSong({this.type, this.mid, this.name, this.artist, this.album});

  OursSong.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mid = json['mid'];
    name = json['name'];
    artist = json['artist'].cast<String>();
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['mid'] = this.mid;
    data['name'] = this.name;
    data['artist'] = this.artist;
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    return data;
  }

  Future<String> getUrl() async {
    var response = await HttpUtil().get(
        "https://1426531544223608.cn-hangzhou.fc.aliyuncs.com/2016-08-15/proxy/music.LATEST/all/music/",
        queryParameters: {'mid': mid, 'type': type});
    return json.decode(response)['src'];
  }
}

class Album {
  String? name;

  Album({this.name});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
