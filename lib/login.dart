import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internato_app/model/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:internato_app/cadastro.dart';
import 'package:internato_app/home.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController userControl = TextEditingController();
  TextEditingController passControl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            key: _scaffoldState,
            appBar: AppBar(
              title: Text("A+"),
              backgroundColor: Color.fromARGB(255, 85, 51, 111),
            ),
            body: ScopedModelDescendant<UserModel>(
                builder: (context, child, model) {
              return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("\n\n\n\n\n\n\n\n\n"),
                          TextFormField(
                            // key: _formKey,
                            validator: _validarEmail, controller: userControl,
                            decoration: InputDecoration(
                                labelText: "Usuário",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.emailAddress,
                            /*  onSaved: (value) {
                              _email = value;
                            }, */
                            autofocus: true,
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20.5),
                          ),
                          Text("\n"),
                          TextFormField(
                            // key: _formKey,
                            validator: _validarSenha, controller: passControl,
                            decoration: InputDecoration(
                                labelText: "Senha",
                                labelStyle: TextStyle(color: Colors.blueGrey),
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.text,
                            /*   onSaved: (value) {
                              _password = value;
                            }, */
                            obscureText: true,
                            style: TextStyle(
                                color: Colors.black38, fontSize: 20.5),
                          ),
                          Text("\n"),
                          ButtonTheme(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                if (_validarESalvar()) {
                                  model.singIn(
                                    userControl.text,
                                    passControl.text,
                                    onSuccess,
                                    onFail,
                                  );
                                }
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.5),
                              ),
                              color: Color.fromARGB(255, 85, 51, 111),
                            ),
                          ),
                          ButtonTheme(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                //  model.singIn(_email, _password);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Cadastro())); // Admin
                              },
                              shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.5),
                              ),
                              color: Color.fromARGB(255, 85, 51, 111),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cadastro()));
                              },
                              child: Text("Esqueceu a senha ?"),
                              textColor: Colors.white,
                            ),
                          ),
                          Text("\n\n\n"),
                        ],
                      ),
                    ),
                  )));
            }))
      ],
    );
  }

  String _validarSenha(String value) {
    if (passControl.text == "" || passControl.text.length < 6) {
      return "Senha invalida";
    } else {
      return null;
    }
  }

  String _validarEmail(String value) {
    if (userControl.text == "") {
      return "Email Incorreto !";
    } else {
      return null;
    }
  }

  bool _validarESalvar() {
    final form = _formKey.currentState;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void onSuccess() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Inicial()));
  }

  void onFail() {
    _scaffoldState.currentState.showSnackBar(SnackBar(
      content: Text("Login ou Senha Inválidos !"),
      backgroundColor: Colors.red[500],
      duration: Duration(seconds: 2),
    ));
  }
}
