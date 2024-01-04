part of 'audio_player_bloc.dart';

@immutable
class AudioPlayerState {}

class AudioPlayerInitial extends AudioPlayerState {
  final AudioPlayer playeraudio;
  AudioPlayerInitial({required this.playeraudio});
}
