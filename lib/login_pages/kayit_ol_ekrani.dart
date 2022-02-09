import 'package:flutter/material.dart';

class KayitOlEkrani extends StatelessWidget {
  KayitOlEkrani({Key? key}) : super(key: key);

  String _ad = '';
  String _soyAd = '';
  String _email = '';
  String _sifre = '';

  final _formkey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xFF3949AB),
        ),
        title: const Text(
          'Hesap Oluştur',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Container(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      width: 390.00,
                      height: 550.00,
                      child: Form(
                        key: _formkey3,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 60.0,
                                  bottom: 20.0,
                                  left: 25.0,
                                  right: 25.0),
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    hintText: 'Adınızı giriniz',
                                  ),
                                  validator: (deger) {
                                    if (deger!.length < 3) {
                                      return 'Adınız en az 3 karakter olmalı';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (deger) {
                                    _ad = deger!;
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
