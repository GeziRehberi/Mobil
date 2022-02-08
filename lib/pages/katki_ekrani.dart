import 'package:flutter/material.dart';

class HaritaSayfasi extends StatefulWidget {
  const HaritaSayfasi({Key? key}) : super(key: key);

  @override
  _HaritaSayfasiState createState() => _HaritaSayfasiState();
}

class _HaritaSayfasiState extends State<HaritaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katkı'),
      ),
      body: Center(
        child: Text('Katkı'),
      ),
    );
  }
}
