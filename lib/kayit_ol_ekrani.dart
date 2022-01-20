import 'package:flutter/material.dart';

class KayitOlEkrani extends StatelessWidget {
  const KayitOlEkrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
