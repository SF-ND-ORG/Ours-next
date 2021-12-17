class OursPostEntity {
  final String time;
  final String timestamp;
  final String content;
  final String author;
  final String title;
  final int id;

  const OursPostEntity(
      {this.time = "",
      this.timestamp = "",
      this.content = "测试内容",
      this.author = "测试作者",
      this.title = "测试标题",
      this.id = 1});
}
