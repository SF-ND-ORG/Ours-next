class OursAnnouncementEntity {
  final String time;
  final String timestamp;
  final String content;
  final String author;
  final String title;
  final int id;

  const OursAnnouncementEntity(
      {this.time = "",
      this.timestamp = "",
      this.content = "测试通知",
      this.author = "测试发布者",
      this.title = "测试标题",
      this.id = 1});
  factory OursAnnouncementEntity.fromJson(Map<String, dynamic> json) =>
      OursAnnouncementEntity(
        time: json["time"],
        content: json["summary"],
        author: json["author"],
      );
}
