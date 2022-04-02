import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../dashboard/dashboardscreen.dart';

class introscreen extends StatefulWidget {
  const introscreen({Key? key}) : super(key: key);

  @override
  State<introscreen> createState() => _introscreenState();
}

class _introscreenState extends State<introscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: Stack(children: <Widget>[
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'assets/bgimages/SplashBg.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          bottom: 0,
          left: 15,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/logo@2x.png',
                width: 60,
                height: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: 'UVE',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: color_white),
                    children: [
                      TextSpan(
                        text: 'NTO',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_gold,
                            fontSize: 35),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                  child: Text(
                "There's a lot happening around you!Our mission is to provide what's happening near you!",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20),
              )),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(dashboardscreen,transition:Transition.fadeIn );

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const dashboardscreen()),
                      ModalRoute.withName("/login"));
                },
                child: SizedBox(
                    width: 350,
                    child: Row(
                      children: const [
                        Text(
                          "Getting Started",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 25,
                          color: color_white,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
