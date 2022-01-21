import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KayitOlEkrani extends StatelessWidget {
  KayitOlEkrani({Key? key}) : super(key: key);
  final FocusNode focusName = FocusNode();

  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hesap Oluştur')),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Container(
                    width: 360.00,
                    height: 580.00,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusName,
                            controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                fontFamily: "SignikaSemiBold",
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                hintText: "Adınızı giriniz",
                                hintStyle: TextStyle(
                                    fontFamily: "SignikaSemiBold",
                                    fontSize: 18.0)),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
