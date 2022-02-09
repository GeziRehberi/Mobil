import 'package:flutter/material.dart';
import 'package:flutter_widgets/login_pages/sifre_yenileme_ekrani.dart';

class KoduDogrula extends StatelessWidget {
  const KoduDogrula({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xFF3949AB),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
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
              padding: EdgeInsets.only(left: 60, right: 60, top: 10),
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: 'Kodu giriniz',
                  hintStyle: TextStyle(),
                ),
              ),
            ),
            SizedBox(height: 5),
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
            SizedBox(height: 10),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xFF3949AB),
                  borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3949AB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SifreYenile()));
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
