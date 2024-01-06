import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:jogja_streamers/bloc/audio_player_bloc.dart";
import "package:jogja_streamers/bloc/radio_is_play_bloc.dart";
import "package:jogja_streamers/bloc/radio_play_bloc.dart";
import "package:jogja_streamers/config/theme/colorStyle.dart";
import "package:jogja_streamers/controller/playerController.dart";
import "package:jogja_streamers/pages/TabViews/home.dart";
import "package:jogja_streamers/pages/TabViews/profil.dart";
import "package:jogja_streamers/pages/TabViews/search.dart";
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:animated_music_indicator/animated_music_indicator.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(_selectedIndex);
    });
  }

  bool headeropen = false;
  bool isPlay = true;

  List<Widget> _tabBarView = [Home(), Search(), Profil()];
  SolidController _solidController = SolidController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabBarView.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: TabBarView(
        children: _tabBarView,
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomSheet: BlocBuilder<RadioPlayBloc, Map<String, dynamic>>(
          builder: (context, state) {
        String url = "";
        if (state['link'] != null) {
          url = state['link'];
        }
        print(state['nama']);

        return state['nama'] != null
            ? SolidBottomSheet(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                controller: _solidController,
                headerBar: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: cBackground2,
                  ),
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   width: 30,
                                //   height: 30,
                                //   decoration: BoxDecoration(
                                //       border: Border.all(color: Colors.white)),
                                // ),
                                Image.network(
                                  state['gambar'],
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 23,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state['nama'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "Sedang didengarkan",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            BlocBuilder<RadioIsPlayBloc, bool>(
                                builder: (context, state) {
                              return AnimatedMusicIndicator(
                                animate: state,
                                numberOfBars: 3,
                                color: Colors.white,
                                barStyle: BarStyle.dash,
                              );
                            }),
                          ],
                        )),
                  ),
                ),
                body: Container(
                  color: cBackground2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Image.network(
                            state['gambar'],
                            width: 200,
                            height: 200,
                          ))),
                      Center(
                        child: BlocBuilder<RadioIsPlayBloc, bool>(
                            builder: (context, state) {
                          bool cek = state;
                          return BlocBuilder<AudioPlayerBloc, AudioPlayer>(
                            builder: (context, state) {
                              return cek == true
                                  ? IconButton(
                                      onPressed: () async {
                                        await playerController()
                                            .isPlay(context, false);
                                        await state.pause();
                                      },
                                      icon: Icon(
                                        Icons.pause_rounded,
                                        size: 70,
                                        color: cButton,
                                      ))
                                  : IconButton(
                                      onPressed: () async {
                                        await playerController()
                                            .isPlay(context, true);
                                        await state.setUrl(url);
                                        await state.play();
                                      },
                                      icon: Icon(Icons.play_arrow_rounded,
                                          size: 70, color: cButton));
                            },
                          );
                        }),
                      )
                    ],
                  ),
                ),
              )
            : SolidBottomSheet(
                canUserSwipe: false,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                controller: _solidController,
                headerBar: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: cBackground2,
                    ),
                    child: Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   width: 30,
                              //   height: 30,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.white)),
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tidak ada yang diputar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "Silahkan pilih radio untuk diputar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )),
                body: Container(
                  color: cBackground2,
                ),
              );
      }),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: cBackground,
        unselectedItemColor: Colors.white,
        selectedItemColor: cButton,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
