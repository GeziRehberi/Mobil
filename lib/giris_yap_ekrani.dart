import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'kayit_ol_ekrani.dart';

class GirisYapEkrani extends StatelessWidget {
  const GirisYapEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Email giriniz: abc@gmail.com'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "E-mail girmek zorunlu"),
                        EmailValidator(errorText: "Geçerli bir mail giriniz:"),
                      ]),
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
                    onPressed: () {},
                    child: Text(
                      'Şifremi Unuttum',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: OutlinedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => GirisYapEkrani()));
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
