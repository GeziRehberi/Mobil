import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_pages/giris_yap_ekrani.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 57,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xA0A4BFFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(CupertinoIcons.person),
                ),
                title: const Text(
                  'Account Settings',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: const Text(
                  'Privacy,Language',
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xA0A4BFFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: const Text(
                  'Privacy',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(CupertinoIcons.shield_fill),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xA0A4BFFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: const Text(
                  'Help & Support',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(CupertinoIcons.question_circle),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xA0A4BFFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: const Text(
                  'Invite a Friend',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Icon(CupertinoIcons.person_add_solid),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Color(0xA0A4BFFF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.logout),
                ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showMyDialog(context);
                    },
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 17, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> showMyDialog(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Emin Misin?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Hayır')),
              TextButton(
                  onPressed: () {
                    //Giriş yap sayfasına yönlendirir ve geriye dönmesini engeller
                    Navigator.of(context).pushAndRemoveUntil(
                      CupertinoPageRoute(
                          builder: (context) => GirisYapEkrani()),
                      (_) => false,
                    );
                    /*SystemChannels.platform.invokeMethod(
                        'SystemNavigator.pop');*/ //evet butonuna basınca direkt uygulamadan çıkış yapıyor
                  },
                  child: const Text('Evet')),
            ],
          );
        },
      );
}
