import 'package:flutter/material.dart';

import 'giris/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget splashScreen = SplashScreen();

    return MaterialApp(
      title: 'Gezi Rehberi',
      debugShowCheckedModeBanner: false,
      home: splashScreen,
    );
  }
}
