import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogja_streamers/controller/apiController.dart';
import 'package:jogja_streamers/controller/playerController.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class _SplashScreenState extends State<SplashScreen> {
  cek() async {
    await Future.delayed(Duration(seconds: 2));

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    await fetchAPI().fetchRadio(context);

    context.go('/login');
  }

  @override
  void initState() {
    super.initState();
    cek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        "assets/logo/original.png",
        width: 300,
      )),
    );
  }
}
