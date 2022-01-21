import 'package:flutter/material.dart';

class KoduDogrula extends StatelessWidget {
  const KoduDogrula({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
              child: Center(
                child: Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Mail Adresinizi doğrulayın?',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF3949AB),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                child: Center(
                  child: Text(
                    'Lütfen 6 haneli kodu giriniz',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelStyle: TextStyle(color: Colors.blue)),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: Text(
                'Kodu Tekrar Gönder',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.blue,
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),
            SizedBox(height: 15),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xFF3949AB),
                  borderRadius: BorderRadius.circular(30)),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => KoduDogrula()));
                },
                child: Text(
                  'Onayla',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
