import 'package:just_audio/just_audio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayer> {
  AudioPlayerBloc() : super(AudioPlayer()) {
    on<AudioPlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
