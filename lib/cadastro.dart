import 'package:flutter/material.dart';
import 'package:internato_app/model/userModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:image_picker/image_picker.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _quartoController = TextEditingController();
  final _nomeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> userData = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criar usuário"),
          backgroundColor: Color.fromARGB(255, 85, 51, 111),
        ),
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
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
                      Text("\n"),
                      GestureDetector(
                        child: Icon(Icons.person_add,size: 150,),
                        onTap: () {
                          _optionsDialogBox();
                        },
                      ),Text("\n"),
                      TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                            hintText: "Nome Completo:",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20.5),
                      ),
                      Text("\n"),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email:",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20.5),
                        validator: (text) {
                          if (text.isEmpty || !text.contains("@"))
                            return "E-mail Inválido";
                        },
                      ),
                      Text("\n"),
                      TextFormField(
                        controller: _quartoController,
                        decoration: InputDecoration(
                            hintText: "Número do Quarto:",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20.5),
                      ),
                      Text("\n"),
                      TextFormField(
                        controller: _senhaController,
                        decoration: InputDecoration(
                            hintText: "Senha:",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20.5),
                        validator: (text) {
                          if (text.isEmpty || text.length < 6)
                            return "Senha Inválida";
                        },
                      ),
                      Text("\n"),
                      TextFormField(
                        controller: _telefoneController,
                        decoration: InputDecoration(
                            hintText: "Telefone:",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        style:
                            TextStyle(color: Colors.blue[800], fontSize: 20.5),
                      ),
                      Text("\n"),
                      ButtonTheme(
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: () => {
                            if (_formKey.currentState.validate())
                              {
                                userData = {
                                  'nome': _nomeController.text,
                                  'email': _emailController.text,
                                  'quarto': _quartoController.text,
                                  'telefone': _telefoneController.text,
                                },
                                model.singUp(
                                    userData: userData,
                                    onFail: _onFail,
                                    onSucess: _onSucess,
                                    pass: _senhaController.text)
                              }
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            "Criar usuário",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.5),
                          ),
                          color: Color.fromARGB(255, 85, 51, 111),
                        ),
                      ),
                    ],
                  ),
                ),
              )));
        }));
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Nova Foto ?'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Selecionar da Galeria ?.'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  void openGallery() async {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  void _onSucess() {}
  void _onFail() {}
}
