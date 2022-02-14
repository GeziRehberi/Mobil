import 'package:flutter/material.dart';
import 'package:flutter_widgets/login_pages/acilis_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: title, home: SplashScreen());
  }
}
