import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internato_app/listaEventos.dart';
import 'package:internato_app/login.dart';
import 'package:internato_app/model/userModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: "internato app",
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
