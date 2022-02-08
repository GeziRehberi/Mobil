import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/login_pages/giris_yap_ekrani.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({Key? key}) : super(key: key);

  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  String _logo =
      'https://pbs.twimg.com/profile_images/1408322029061824512/7oNDK2Tb_400x400.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 8, top: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_logo),
                    radius: 30,
                  ),
                  SizedBox(width: 7),
                  Text(
                    ' Nuri Ulgen',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 155),
                    child: IconButton(
                        icon: Icon(Icons.more_vert), onPressed: () {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Takip Edilenler : 15',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Takipçiler : 97',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 180),
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Beğenilen Mekanlar'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        side: BorderSide(
                          width: 3,
                          color: Colors.black,
                        ),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 180),
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Yorumlarım'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        side: BorderSide(
                          width: 3,
                          color: Colors.black,
                        ),
                        shape: RoundedRectangleBorder(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 250),
                  child: Row(
                    children: [
                      Icon(
                        Icons.power_settings_new,
                        size: 40,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Color(0xFF3949AB),
                            borderRadius: BorderRadius.circular(20)),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                  builder: (context) => const GirisYapEkrani()),
                            );
                          },
                          child: Text(
                            'Çıkış Yap',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
