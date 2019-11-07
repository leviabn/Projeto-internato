import 'package:flutter/material.dart';
import 'package:internato_app/home.dart';
import 'package:internato_app/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "internato app",
      home: Inicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}




 
