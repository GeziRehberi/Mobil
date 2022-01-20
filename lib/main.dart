import 'package:flutter/material.dart';

import 'giris_yap_ekrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gezi Rehberi',
      debugShowCheckedModeBanner: false,
      home: GirisYapEkrani(),
    );
  }
}
