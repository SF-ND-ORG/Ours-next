import 'package:ours_next/data/OursPostEntity.dart';

class OursPostListResponseEntity {
  final int count = 10;
  List<OursPostEntity>? items;

  OursPostListResponseEntity({this.items});

  factory OursPostListResponseEntity.fromJson(List<dynamic> json) =>
      OursPostListResponseEntity(
        items: json == []
            ? []
            : List<OursPostEntity>.from(
                json.map((x) => OursPostEntity.fromJson(x))),
      );
}
