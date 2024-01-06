part of 'audio_service_bloc.dart';

@immutable
class AudioServiceState {}

class AudioServiceInitial extends AudioServiceState {
  final AudioService tes;
  AudioServiceInitial({required this.tes});
}
