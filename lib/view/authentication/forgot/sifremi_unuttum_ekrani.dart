import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../register/dogrulama_kodu_ekrani.dart';

class SifremiUnutttumEkrani extends StatefulWidget {
  SifremiUnutttumEkrani({Key? key}) : super(key: key);

  @override
  State<SifremiUnutttumEkrani> createState() => _SifremiUnutttumEkraniState();
}

class _SifremiUnutttumEkraniState extends State<SifremiUnutttumEkrani> {
  String _email = '';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmEmailController = TextEditingController();

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
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
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
                        controller: _confirmEmailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            hintText: 'Email adresinizi doğrulayınız'),
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
                          } else if (_emailController.text !=
                              _confirmEmailController.text) {
                            return "Mailler eşleşmiyor!";
                          } else {
                            return null;
                          }
                        },
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF3949AB),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                onPressed: () {
                  bool _validate = _formkey2.currentState!.validate();
                  if (_validate) {
                    _formkey2.currentState!.save();
                    // bilgileri okuyup ekranda göstermesi
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Kod mail adresinize gönderilmiştir',
                      ),
                    ));
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => KoduDogrula()));
                  }
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
