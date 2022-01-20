import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'sign_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: SignInScreen(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "assets/konum.png",
      text: "Gezi Rehberi",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}
