import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SifremiUnutttumEkrani extends StatelessWidget {
  SifremiUnutttumEkrani({Key? key}) : super(key: key);

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
                      style: TextStyle(fontSize: 25, color: Colors.indigo),
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
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    hintText: 'Email adresinizi giriniz'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "E-mail girmek zorunlu"),
                  EmailValidator(errorText: "Geçerli bir email giriniz:"),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    hintText: 'Email adresinizi doğrulayınız'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "E-mail girmek zorunlu"),
                  EmailValidator(errorText: "Geçerli bir email giriniz:"),
                ]),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
