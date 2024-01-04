import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jogja_streamers/bloc/audio_player_bloc.dart';
import 'package:jogja_streamers/bloc/radio_is_play_bloc.dart';
import 'package:jogja_streamers/bloc/radio_list_bloc.dart';
import 'package:jogja_streamers/bloc/radio_play_bloc.dart';
import 'package:jogja_streamers/config/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RadioListBloc()),
        BlocProvider(create: (context) => RadioPlayBloc()),
        BlocProvider(create: (context) => RadioIsPlayBloc()),
        BlocProvider(create: (context) => AudioPlayerBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterX().router,
      ),
    );
  }
}
