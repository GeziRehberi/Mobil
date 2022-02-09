import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/bottom_navigator_ekrani.dart';
import 'kayit_ol_ekrani.dart';
import 'sifremi_unuttum_ekrani.dart';

class GirisYapEkrani extends StatelessWidget {
  const GirisYapEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _email = '';
    GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    String? validatePassword(String value) {
      if (value.isEmpty) {
        return "* gerekli";
      } else if (value.length < 6) {
        return "Şifre en az 6 karakter olmalı";
      } else
        return null;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 130),
              child: Center(
                child: Container(
                  width: 180,
                  height: 43,
                  child: Center(
                    child: Text(
                      'Gezi Rehberi',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset(
                'assets/konum.png',
                scale: 1,
              ),
            ),
            SizedBox(height: 20),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Email giriniz: abc@gmail.com'),
                      onSaved: (deger) {
                        _email = deger!; // verilerin kaydedilmesi
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
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Şifre',
                            hintText: 'Şifrenizi Giriniz'),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Şifre girmek zorunlu"),
                          MinLengthValidator(6,
                              errorText: "Şifre en az 6 karakter olmalıdır"),
                        ])
                        //validatePassword,        //Function to check validation
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SifremiUnutttumEkrani()));
                    },
                    child: Text(
                      'Şifremi Unuttum',
                      style: TextStyle(color: Color(0xFF3949AB), fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Color(0xFF3949AB),
                        borderRadius: BorderRadius.circular(20)),
                    child: OutlinedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const BottomNavigatorPage()),
                          );
                          print("Doğrulandı");
                        } else {
                          print("Doğrulanmadı");
                        }
                      },
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(height: 90),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => KayitOlEkrani()));
                    },
                    child: Text(
                      'Henüz bir hesabınız yoksa kaydolun',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
