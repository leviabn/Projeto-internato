import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internato_app/atualizar.dart';
import 'package:internato_app/cardapio.dart';
import 'package:internato_app/listaEventos.dart';
import 'package:internato_app/muralEventos.dart';
import 'package:internato_app/ordemServico.dart';
import 'package:internato_app/widgets/custom_drawer.dart';
import 'package:image_picker/image_picker.dart';

class Inicial extends StatefulWidget {
 
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text(
              "Inicio",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 85, 51, 111),
          ),
          body: Container(
              child: Scaffold(
                  body: SingleChildScrollView(
                      child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("\n"),
                  Container(
                    child: Icon(
                      Icons.local_library, //import_contacts , local_library
                      size: 30,
                      color: Colors.black,
                    ),
                    alignment: Alignment(9, 1),
                  ),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () => {_optionsDialogBox()},
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Text(
                        "Cultos",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Text("\n"),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cardapio()))
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Cardápio",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Text("\n"),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrdemServico()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Ordem de Serviço",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Text("\n"),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MuralEventos()))
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Cadastrar eventos",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Text("\n"),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListaEventos()))
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Mural de eventos",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Text("\n"),
                  ButtonTheme(
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Atualizar()));
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "Atualizar Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 17.5),
                      ),
                      color: Color.fromARGB(255, 85, 51, 111),
                    ),
                  ),
                  Icon(
                    Icons.local_library,
                    //import_contacts , local_library
                    size: 40,
                    color: Colors.white,
                  ),
                  Text("\n"),
                  Text("\n"),
                ],
              ),
            ),
          )))),
        ),
      ],
    );
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
                    child: new Text('Capturar QRCode'),
                    onTap: openCamera,
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
}
