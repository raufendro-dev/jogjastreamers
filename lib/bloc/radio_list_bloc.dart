import 'package:bloc/bloc.dart';
import 'package:jogja_streamers/model/stationModel.dart';
import 'package:meta/meta.dart';

part 'radio_list_event.dart';
part 'radio_list_state.dart';

class RadioListBloc extends Bloc<RadioListEvent, List> {
  RadioListBloc() : super([]) {
    on<RadioListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
