part of 'radio_list_bloc.dart';

@immutable
class RadioListState {}

class RadioListInitial extends RadioListState {
  final List<Station> station_list;
  RadioListInitial({required this.station_list});
}
