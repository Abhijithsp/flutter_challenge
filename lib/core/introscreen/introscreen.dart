import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../dashboard/dashboardscreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: Stack(
        children: <Widget>[
          // Background Image with dark overlay gradient
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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color_dark.withOpacity(0.3),
                  color_dark.withOpacity(0.85),
                  color_dark,
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),
          
          // Subtle glowing orb
          Positioned(
            bottom: 120,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color_gold.withOpacity(0.12),
                    blurRadius: 90,
                    spreadRadius: 40,
                  ),
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/icons/logo@2x.png',
                  width: 70,
                  height: 70,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    text: 'UVE',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: color_white,
                      letterSpacing: 1.0,
                    ),
                    children: [
                      TextSpan(
                        text: 'NTO',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: color_gold,
                          fontSize: 40,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "There's a lot happening around you! Our mission is to show you what's happening near you.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: color_white.withOpacity(0.85),
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Getting Started Button
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          color_gold,
                          Color(0xffE2BE5C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: color_gold.withOpacity(0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Getting Started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: color_dark,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                          color: color_dark,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
