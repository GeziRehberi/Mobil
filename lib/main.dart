import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/login_pages/acilis_ekrani.dart';
import 'package:wiredash/wiredash.dart';

import 'model/themes.dart';
import 'model/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ekran yatay döndürme kilitlendi sadece portre modu açık
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final user = UserPreferences.getUser();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => Wiredash(
          projectId: 'YOUR-PROJECT-ID',
          secret: 'YOUR-SECRET',
          navigatorKey: _navigatorKey,
          child: MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
