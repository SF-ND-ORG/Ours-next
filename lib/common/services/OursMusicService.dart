import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:ours_next/data/OursSong.dart';

class OursMusicController extends GetxController {
  OursMusicController();

  // AudioPlayer 对象
  var player = AudioPlayer();

  // 当前是否触摸进度条
  bool isTouch = false;

  final percent = 0.0.obs; // 播放进度百分比

  final totalTime = 0.0.obs; // 总时间

  final currentTime = 0.obs; // 已播放时间

  final RxList<OursSong> playList = <OursSong>[].obs; // 播放列表

  final currentIndex = 0.obs; // 当前歌曲索引

  final Rx<OursSong?> currentSong = Rx<OursSong?>(null); // 当前歌曲

  int get songCount => playList.length; // 播放列表长度

  final playing = false.obs; // 是否正在播放

  Future<void> initMusicPlayer() async {
    addSong(
        OursSong(mid: "C1431292823", type: "music", name: '夜航星', artist: ['']));
    player.stop();
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });

    Duration? duration;

    nextSong();

    currentSong.value = playList[currentIndex.value];
    totalTime.value = duration?.inSeconds.toDouble() ?? 0;
  }

  // 控制播放
  pause() async {
    if (currentSong.value == null) return;
    playing.value = false;
    await player.pause();
  }

  // 控制暂停
  play() async {
    if (currentSong.value == null) return;
    playing.value = true;
    await player.play();
  }

  onPlayPauseButton() {
    print("onPlayPauseButton");
    if (!playing.value)
      play();
    else
      pause();
  }

  // 跳转到指定时间
  seekTime(int seconds) async {
    await player.seek(Duration(seconds: seconds));
  }

  changePercent() {
    if (totalTime.value == 0) return 0;
    if (!isTouch) {
      var v = (currentTime.value / totalTime.value).toDouble();
      v = v > 1 ? 1 : v;
      v = v < 0 ? 0 : v;
      percent.value = v;
    }
  }

  addSong(OursSong song) {
    playList.add(song);
  }

  playSong(OursSong s) async {
    pause();
    addSong(s);
    currentIndex.value = songCount - 1;
    currentSong.value = playList[currentIndex.value];
    Duration? duration;
    try {
      duration = await player.setAudioSource(
          AudioSource.uri(Uri.parse(await currentSong.value!.getUrl())));
    } catch (e) {
      print("Error loading audio source: $e");
    }
    totalTime.value = duration?.inSeconds.toDouble() ?? 0;
    play();
  }

  nextSong() async {
    pause();
    if (currentIndex.value + 1 < songCount) {
      currentIndex.value += 1;
    } else {
      currentIndex.value = 0;
    }
    currentSong.value = playList[currentIndex.value];
    Duration? duration;
    try {
      duration = await player.setAudioSource(
          AudioSource.uri(Uri.parse(await currentSong.value!.getUrl())));
    } catch (e) {
      print("Error loading audio source: $e");
    }
    totalTime.value = duration?.inSeconds.toDouble() ?? 0;
    play();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    initMusicPlayer();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    player.positionStream.listen((event) {
      if (isTouch) return;
      currentTime.value = event.inSeconds;
      changePercent();
    });
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
