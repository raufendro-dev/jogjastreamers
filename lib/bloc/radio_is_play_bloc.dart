import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_is_play_event.dart';
part 'radio_is_play_state.dart';

class RadioIsPlayBloc extends Bloc<RadioIsPlayEvent, bool> {
  RadioIsPlayBloc() : super(false) {
    on<RadioIsPlayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
