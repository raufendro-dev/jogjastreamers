import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogja_streamers/bloc/radio_is_play_bloc.dart';
import 'package:jogja_streamers/bloc/radio_play_bloc.dart';

class playerController {
  Future<Map<String, dynamic>> radio(
      BuildContext context, nama, link, gambar) async {
    RadioPlayBloc bloc = BlocProvider.of<RadioPlayBloc>(context);
    Map<String, dynamic> memutar = {
      "nama": nama,
      "link": link,
      "gambar": gambar
    };
    bloc.emit(memutar);
    return memutar;
  }

  isPlay(BuildContext context, bool play) async {
    RadioIsPlayBloc bloc = BlocProvider.of<RadioIsPlayBloc>(context);
    bloc.emit(play);
  }
}
