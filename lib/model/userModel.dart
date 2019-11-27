import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  Firestore db;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void singUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSucess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();
    _auth
        .createUserWithEmailAndPassword(
            email: userData["email"], password: pass)
        .then((user) async {
      firebaseUser = user;
      //DocumentSnapshot userD = await db.collection('usuarios').document(user.uid).get();
      await _saveUserData(userData);
      onSucess();
      isLoading = false;

      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void singIn(String email, String senha, VoidCallback onSuccess,
      VoidCallback onFail) async {
    isLoading = true;
    notifyListeners();
    await _auth
        .signInWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then((user) {
      firebaseUser = user;
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  void recorverPass() {}

  void isLoggedIn() {}

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData(userData);
  }

  Future<Null> saveOrdemData(
      {Map<String, dynamic> ordemData, @required VoidCallback onSucess}) async {
    isLoading = true;
    notifyListeners();
    await Firestore.instance
        .collection("Ordem de serviço")
        .document()
        .setData(ordemData)
        .then((_) {
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      isLoading = false;
      notifyListeners();
    });
  }

  // Future<Null> deleteEvento({Map<String, dynamic> eventoData, @required VoidCallback onSucess}){
  //    isLoading = true;
  //   notifyListeners();
  //   await Firestore.instance
  //       .collection("eventos")
  //       .document()
  //       .setData(eventoData)
  // }

  Future<Null> saveEventoData(
      {Map<String, dynamic> eventoData, @required VoidCallback onSucess}) async {
    isLoading = true;
    notifyListeners();
    await Firestore.instance
        .collection("eventos")
        .document()
        .setData(eventoData)
        .then((_) {
      onSucess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      print(e);
      isLoading = false;
      notifyListeners();
    });
  }
}
