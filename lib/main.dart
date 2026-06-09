import 'package:flutter/material.dart';

import 'core/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uvento Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffD3AC45),
          brightness: Brightness.dark,
          primary: const Color(0xffD3AC45),
          surface: const Color(0xff102733),
          background: const Color(0xff102733),
        ),
        scaffoldBackgroundColor: const Color(0xff102733),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff102733),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
