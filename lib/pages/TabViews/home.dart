// import 'package:audioplayers/audioplayers.dart';
import 'package:audio_service/audio_service.dart';
import 'package:jogja_streamers/services/notification_services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:jogja_streamers/bloc/audio_player_bloc.dart';

import 'package:jogja_streamers/bloc/radio_is_play_bloc.dart';
import 'package:jogja_streamers/bloc/radio_list_bloc.dart';
import 'package:jogja_streamers/bloc/radio_play_bloc.dart';
import 'package:jogja_streamers/config/theme/colorStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jogja_streamers/controller/playerController.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final List<String> imgList = [
  "http://raufendro-dev.com/gambar/1.jpg",
  "http://raufendro-dev.com/gambar/2.jpg",
];

class _HomeState extends State<Home> {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(item, fit: BoxFit.cover, width: 750.0)),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 25, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/logo/white.png",
                  width: 250,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: cButton,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
            items: imageSliders,
          )),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              "Paling Banyak Didengar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          BlocBuilder<RadioListBloc, List>(builder: (context, state) {
            return Expanded(
                child: ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                String nama = state[index].radioName;
                String url = state[index].radioUrl;
                String gambar = state[index].radioImage;
                print(state[index].radioName);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  state[index].radioImage.toString(),
                                  width: 50,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state[index].radioName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  state[index].countryName,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        BlocBuilder<RadioPlayBloc, Map<String, dynamic>>(
                            builder: (context, state) {
                          var namastate = state['nama'];
                          return BlocBuilder<AudioPlayerBloc, AudioPlayer>(
                            builder: (context, state) {
                              return namastate != nama
                                  ? IconButton(
                                      onPressed: () async {
                                        await NotificationService()
                                            .initNotification();
                                        await NotificationService()
                                            .showNotification(
                                                nama, 'Sedang didengarkan');
                                        print(url);
                                        await playerController()
                                            .radio(context, nama, url, gambar);
                                        await playerController()
                                            .isPlay(context, true);
                                        await state.setUrl(url);
                                        await state.play();
                                      },
                                      icon: Icon(Icons.play_arrow_rounded,
                                          color: cButton))
                                  : BlocBuilder<RadioIsPlayBloc, bool>(
                                      builder: (context, state) {
                                      return state == true
                                          ? Text("Playing",
                                              style: TextStyle(
                                                  color: Colors.white))
                                          : Text("Paused",
                                              style: TextStyle(
                                                  color: Colors.white));
                                    });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ));
          })
        ],
      )),
    );
  }
}
