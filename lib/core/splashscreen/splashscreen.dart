import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../introscreen/introscreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = const Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const introscreen()),
        ModalRoute.withName("/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/icons/logo@2x.png',
              width: 125,
              height: 125,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _title2()
        ],
      ),
    );
  }

  Widget _title2() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'UVE',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: color_white),
          children: [
            TextSpan(
              text: 'NTO',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: color_gold, fontSize: 35),
            ),
          ]),
    );
  }
}
