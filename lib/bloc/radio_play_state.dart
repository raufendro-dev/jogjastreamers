part of 'radio_play_bloc.dart';

@immutable
class RadioPlayState {}

class RadioPlayInitial extends RadioPlayState {
  final Map<String, dynamic> radioplay;
  RadioPlayInitial({required this.radioplay});
}
