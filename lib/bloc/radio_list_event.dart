part of 'radio_list_bloc.dart';

@immutable
class RadioListEvent {
  final List<Station> station_list;
  RadioListEvent({required this.station_list});
}
