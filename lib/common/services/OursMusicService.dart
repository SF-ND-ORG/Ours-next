import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class OursMusicController extends GetxController {
  OursMusicController();

  // AudioPlayer 对象
  var player = AudioPlayer();

  // 当前是否触摸进度条
  bool isTouch = false;

  final percent = 0.0.obs; // 播放进度百分比

  final totalTime = 0.0.obs; // 总时间

  final currentTime = 0.obs; // 已播放时间

  Future<void> initMusicPlayer() async {
    player.stop();
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });

    Duration? duration;

    // Try to load audio from a source and catch any errors.
    try {
      duration = await player.setAudioSource(AudioSource.uri(Uri.parse(
          "http://m7.music.126.net/20220106224557/004e0704a2cc32eeb7f3d6ed6112c19d/ymusic/obj/w5zDlMODwrDDiGjCn8Ky/2736681512/da39/fb81/6671/34c0a0742af5c9ae9ada9ad1716ddbb0.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
    totalTime.value = duration?.inSeconds.toDouble() ?? 0;
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
