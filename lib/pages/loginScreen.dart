import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogja_streamers/config/theme/colorStyle.dart';
import 'package:jogja_streamers/config/theme/textStyle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBackground,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo/white.png",
              width: 300,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text(
              "Username",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: TextField(
                    autofocus: true,
                    decoration:
                        new InputDecoration.collapsed(hintText: 'Username'),
                    onSubmitted: (value) {},
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21),
            child: Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: TextField(
                    autofocus: true,
                    obscureText: true,
                    decoration:
                        new InputDecoration.collapsed(hintText: 'Password'),
                    onSubmitted: (value) {},
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                print("pencet");
                context.go('/home');
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: cButton, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text:
                        "Dengan Masuk atau Daftar, berarti kamu telah\nmenyetujui ",
                    style: body.copyWith(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Syarat & Ketentuan ',
                          style: body.copyWith(color: cButton),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // code to open / launch terms of service link here
                            }),
                      TextSpan(
                        text: "yang berlaku.",
                        style: body.copyWith(color: Colors.white),
                      )
                    ])),
          )
        ],
      )),
    );
  }
}
