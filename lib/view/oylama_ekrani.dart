import 'package:flutter/material.dart';

class OylamaSayfasi extends StatefulWidget {
  const OylamaSayfasi({Key? key}) : super(key: key);

  @override
  _OylamaSayfasiState createState() => _OylamaSayfasiState();
}

class _OylamaSayfasiState extends State<OylamaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oylama'),
      ),
      body: Center(
        child: Text('Oylama'),
      ),
    );
  }
}
