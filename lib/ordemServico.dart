import 'package:flutter/material.dart';
import 'package:internato_app/home.dart';

class OrdemServico extends StatefulWidget {
  @override
  _OrdemServicoState createState() => _OrdemServicoState();
}



class _OrdemServicoState extends State<OrdemServico> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _switchVal = true;
  bool _checkBoxVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Ordem de Serviço"),
        backgroundColor: Color.fromARGB(255, 85, 51, 111),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Descreva o Problema",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 85, 51, 111))),
                  ),
                ),
                RaisedButton(
                  color: Color.fromARGB(255, 85, 51, 111),
                  child: Text("Enviar"),
                  textColor: Colors.white,
                  onPressed: () {
                  _onSuccess();
                  },
                )
              ],
            ),
          ),
          Text('Urgência'),
        Center(
          child: Switch(
            onChanged: (bool value) {
              setState(() => this._switchVal = value);
            },
            value: this._switchVal,
          ),
        ),
        
        ],
      ),
    );
  }
  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Cadastro Efetuado com Sucesso !"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 5),
    ));

    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Inicial()));
    });
  }
}




