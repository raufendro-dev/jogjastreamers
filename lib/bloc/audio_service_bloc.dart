import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:audio_service/audio_service.dart';
part 'audio_service_event.dart';
part 'audio_service_state.dart';

class AudioServiceBloc extends Bloc<AudioServiceEvent, AudioService> {
  AudioServiceBloc() : super(AudioService()) {
    on<AudioServiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
