import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_play_event.dart';
part 'radio_play_state.dart';

class RadioPlayBloc extends Bloc<RadioPlayEvent, Map<String, dynamic>> {
  RadioPlayBloc() : super({}) {
    on<RadioPlayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
