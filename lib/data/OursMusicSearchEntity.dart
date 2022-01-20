import 'package:flutter/cupertino.dart';
import 'package:ours_next/data/OursSong.dart';

class OursMusicSearchRequestEntity {
  final limit;
  final keyword;
  final platform;
  final type;
  final offset;
  OursMusicSearchRequestEntity(
      {this.limit = 20,
      this.keyword = '',
      this.offset = 0,
      this.platform = 'C',
      this.type = 'music'});
}

class OursMusicSearchResponseEntity {
  final count = 20;
  List<OursSong>? items;
  OursMusicSearchResponseEntity({this.items});

  factory OursMusicSearchResponseEntity.fromJson(List<dynamic> json) =>
      OursMusicSearchResponseEntity(
        items: json == []
            ? []
            : List<OursSong>.from(json.map((x) => OursSong.fromJson(x))),
      );
}
