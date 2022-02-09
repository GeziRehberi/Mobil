import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'dogrulama_kodu_ekrani.dart';

class SifremiUnutttumEkrani extends StatefulWidget {
  SifremiUnutttumEkrani({Key? key}) : super(key: key);

  @override
  State<SifremiUnutttumEkrani> createState() => _SifremiUnutttumEkraniState();
}

class _SifremiUnutttumEkraniState extends State<SifremiUnutttumEkrani> {
  String _email = '';
  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
              child: Center(
                child: Container(
                  child: Center(
                    child: Text(
                      'Şifreni mi Unuttun?',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF3949AB),
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
                    ' Hesabınızla ilişkili e-posta',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Center(
                  child: Text(
                    ' adresini giriniz',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ),
            Form(
                key: _formkey2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            hintText: 'Email adresinizi giriniz'),
                        onSaved: (deger) {
                          _email = deger!;
                          print(_email); // verilerin kaydedilmesi
                        },
                        validator: (deger) {
                          // email doğrulama işlemleri
                          if (deger!.isEmpty) {
                            return 'mail boş olamaz';
                          } else if (!EmailValidator.validate(deger)) {
                            return 'Geçerli bir mail giriniz';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            hintText: 'Email adresinizi doğrulayınız'),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Color(0xFF3949AB),
                  borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => KoduDogrula()));
                },
                child: Text(
                  'Doğrulama Kodu Gönder',
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
