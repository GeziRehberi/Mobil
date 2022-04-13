import 'package:flutter/material.dart';

import '../../core/components/voting.dart';

class OylamaSayfasi extends StatefulWidget {
  const OylamaSayfasi({Key? key}) : super(key: key);

  @override
  _OylamaSayfasiState createState() => _OylamaSayfasiState();
}

class _OylamaSayfasiState extends State<OylamaSayfasi> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Oylama',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          Voting(
            placeName: 'Galata',
            categoryName: 'Turistik Yer',
          ),
          Voting(
            placeName: 'Burger King',
            categoryName: 'Hamburger Resturantı',
          ),
        ]),
      ),
    );
  }
}
