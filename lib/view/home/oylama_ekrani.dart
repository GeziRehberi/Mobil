import 'package:flutter/material.dart';

import '../../core/components/voting.dart';
import '../../core/components/widget/appBar_widget.dart';

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
      appBar: buildAppBar(context, ''),
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
