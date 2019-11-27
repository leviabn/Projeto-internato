import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model/userModel.dart';

class MuralEventos extends StatefulWidget {
  @override
  _MuralEventosState createState() => _MuralEventosState();
}

class _MuralEventosState extends State<MuralEventos> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _descricaoController = TextEditingController();
  final _horarioController = TextEditingController();
  final _localController = TextEditingController();

  Map<String, dynamic> eventoData = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastrar eventos"),
          backgroundColor: Color.fromARGB(255, 85, 51, 111),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          return Column(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                      labelText: "Descreva o evento",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 85, 51, 111))),
                  onChanged: (evento) {},
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _localController,
                  decoration: InputDecoration(
                      labelText: "Local do evento",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 85, 51, 111))),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _horarioController,
                  decoration: InputDecoration(
                      labelText: "Data do evento",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 85, 51, 111))),
                ),
              ),
              RaisedButton(
                color: Color.fromARGB(255, 85, 51, 111),
                child: Text("Enviar"),
                textColor: Colors.amberAccent,
                onPressed: () {
                  eventoData = {
                    'local': _localController.text,
                    'data': _horarioController.text,
                    'descrição': _descricaoController.text,
                  };

                  model.saveEventoData(
                      onSucess: onSuccess, eventoData: eventoData);
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        }));
  }

  void onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Evento efetuado com sucesso !"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
  }
}
