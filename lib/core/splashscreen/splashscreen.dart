import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../introscreen/introscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
    startTime();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startTime() {
    const duration = Duration(seconds: 4);
    Timer(duration, navigationPage);
  }

  void navigationPage() {
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const IntroScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_dark,
      body: Stack(
        children: [
          // Background subtle ambient light
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color_gold.withOpacity(0.08),
                    blurRadius: 100,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.02),
                            border: Border.all(
                              color: color_gold.withOpacity(0.15),
                              width: 1.5,
                            ),
                          ),
                          child: Image.asset(
                            'assets/icons/logo@2x.png',
                            width: 110,
                            height: 110,
                          ),
                        ),
                        const SizedBox(height: 24),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'UVE',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: color_white,
                              letterSpacing: 1.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'NTO',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: color_gold,
                                  fontSize: 36,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'EXPLORE EVENTS NEAR YOU',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: color_white.withOpacity(0.4),
                            letterSpacing: 3.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
