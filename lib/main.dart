import 'package:flutter/material.dart';
import 'package:flutter_widgets/login_pages/acilis_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gezi Rehberi',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
