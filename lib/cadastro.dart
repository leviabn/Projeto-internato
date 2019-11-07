import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  body: Form(
                child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(20),
          
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "NOME COMPLETO:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "SENHA:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "RG:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "CPF:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "TELEFONE:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "FUNÇÃO:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "SEGMENTO:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text("\n"),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "EQUIPE:",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(color: Colors.blue[800], fontSize: 20.5),
                ),
                Text(""),
                ButtonTheme(
                  height: 40.0,
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()))
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
              ],
            ),
          ),
        )
        )
        )
    );
  }
}
