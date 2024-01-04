import 'package:audioplayers/audioplayers.dart';

class audioPl {
  var player = AudioPlayer();

  stop() async {
    await player.stop();
  }

  play(url) async {
    await player.play(UrlSource(url));
  }

  pause() async {
    await player.pause();
  }
}
