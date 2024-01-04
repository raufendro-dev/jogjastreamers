part of 'radio_is_play_bloc.dart';

@immutable
class RadioIsPlayState {}

class RadioIsPlayInitial extends RadioIsPlayState {
  final bool isPlay;
  RadioIsPlayInitial({required this.isPlay});
}
