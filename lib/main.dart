import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/login_pages/acilis_ekrani.dart';
import 'package:flutter_widgets/model/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SplashScreen(),
    );
  }
}
