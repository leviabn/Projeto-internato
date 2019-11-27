import 'package:flutter/material.dart';

class Cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Confira o nosso cardapio"),
          backgroundColor: Color.fromARGB(255, 85, 51, 111),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/internato-5a8b6.appspot.com/o/image1.jpg?alt=media&token=9455066a-edcc-4c3a-aad6-2a79370d2c77",
                    height: 400,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    "----------------------------------------------------------------------------------------",
                    style: TextStyle(backgroundColor: Colors.white24),
                  ),
                  Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/internato-5a8b6.appspot.com/o/image2.jpg?alt=media&token=18007e0d-736a-4479-82a5-beb414380a56",
                    height: 400,
                    width: 350,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
