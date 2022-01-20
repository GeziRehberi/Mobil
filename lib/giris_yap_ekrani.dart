import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class GirisYapEkrani extends StatelessWidget {
  const GirisYapEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
