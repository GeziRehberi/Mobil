import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets/login_pages/acilis_ekrani.dart';
import 'package:flutter_widgets/model/user_preferences.dart';
import 'package:wiredash/wiredash.dart';

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

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'YOUR-PROJECT-ID',
      secret: 'YOUR-SECRET',
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
