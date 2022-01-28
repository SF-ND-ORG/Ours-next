import 'package:ours_next/data/OursAnnouncementEntity.dart';

class OursAnnouncementListResponseEntity {
  final int count = 10;
  List<OursAnnouncementEntity>? items;

  OursAnnouncementListResponseEntity({this.items});

  factory OursAnnouncementListResponseEntity.fromJson(List<dynamic> json) =>
      OursAnnouncementListResponseEntity(
        items: json == []
            ? []
            : List<OursAnnouncementEntity>.from(
                json.map((x) => OursAnnouncementEntity.fromJson(x))),
      );
}
