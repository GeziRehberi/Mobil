import 'package:flutter/material.dart';

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({Key? key}) : super(key: key);

  @override
  _ProfilEkraniState createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  String _logo =
      'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008C8C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 8, top: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(_logo),
                  radius: 30,
                ),
                SizedBox(width: 7),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
