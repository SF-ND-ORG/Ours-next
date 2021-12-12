import 'dart:convert';
import 'package:ours_next/data/OursPostData.dart';
import 'dart:io';

class OursPostService {
  String host = "0.0.0.0";

  Future<List<OursPostData>> getRandomPosts() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http(host, '/posts');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print(responseBody);
    List postsList = json.decode(responseBody);
    List<OursPostData> ret = [];
    for (Map<String, dynamic> item in postsList) {
      ret.add(OursPostData(
          title: item["title"],
          author: item["author"],
          content: item["summary"]));
    }
    return ret;
  }
}
