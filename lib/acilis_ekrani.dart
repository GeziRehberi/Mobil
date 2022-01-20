import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'giris_yap_ekrani.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: GirisYapEkrani(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "assets/konum.png",
      backgroundColor: Colors.white,
    );
  }
}
