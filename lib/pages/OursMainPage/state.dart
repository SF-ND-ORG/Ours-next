import 'package:get/get.dart';
import 'package:ours_next/data/OursPostData.dart';
import 'package:ours_next/widgets/post/OursPostCardWidget.dart';

class OursMainPageState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
  // PostsList
  RxList<OursPostData> _postslist = RxList<OursPostData>();
}
