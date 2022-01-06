import 'dart:html';

class Song {
  Song({
    this.name = '',
    this.artist = '',
    this.picurl = '',
    this.url = '',
    this.album = '',
  });

  //歌曲名称
  String name;
  //歌曲作者
  String artist;
  //歌曲封面url
  String picurl;
  //歌曲文件url
  String url;
  //歌曲专辑
  String album;
}
