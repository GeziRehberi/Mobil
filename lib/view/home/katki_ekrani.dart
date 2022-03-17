import 'package:flutter/material.dart';

class KatkiSayfasi extends StatefulWidget {
  const KatkiSayfasi({Key? key}) : super(key: key);

  @override
  _KatkiSayfasiState createState() => _KatkiSayfasiState();
}

class _KatkiSayfasiState extends State<KatkiSayfasi> {
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
