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
  String _email, _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("A+"),
          ),
          body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
            return Form(
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
                      key: _formKey,
                      validator: _validarEmail,
                      decoration: InputDecoration(
                          labelText: "Usuário",
                          labelStyle: TextStyle(color: Colors.amberAccent),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _email = value;
                      },
                      autofocus: true,
                      style: TextStyle(color: Colors.white, fontSize: 20.5),
                    ),
                    Text("\n"),
                    TextFormField(
                      key: _formKey,
                      validator: _validarSenha,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.amberAccent),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _password = value;
                      },
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontSize: 20.5),
                    ),
                    Text("\n"),
                    ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_validarESalvar()) {
                            model.singIn(_email, _password);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Inicial()));
                          }
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 20.5),
                        ),
                        color: Colors.blue[800],
                      ),
                    ),
                    ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          model.singIn(_email, _password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cadastro())); // Admin
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 20.5),
                        ),
                        color: Colors.blue[800],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cadastro()));
                        },
                        child: Text("Esqueceu a senha ?"),
                        textColor: Colors.white,
                      ),
                    ),
                    Text("\n\n\n"),
                  ],
                ),
              ),
            )
            )
            );
          }
          )
        )
      ],
    );
  }

  String _validarSenha(String value) {
    if (_password.isEmpty) {
      return "Senha invalida";
    } else {
      return null;
    }
  }

  String _validarEmail(String value) {
    if (_email.isEmpty || _email != "@") {
      return "Senha invalida";
    } else {
      return null;
    }
  }

  bool _validarESalvar() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
