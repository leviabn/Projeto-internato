import 'package:flutter/material.dart';
import 'package:internato_app/muralEventos.dart';
import 'package:internato_app/ordemServico.dart';

class Inicial extends StatefulWidget {
  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("\n"),
            Text("\n"),
            Text("\n"),
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
                onPressed: () => {},
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
                onPressed: () => {},
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "Cardápios",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdemServico()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MuralEventos()))
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  "Mural de Eventos",
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
    ))));
  }
}
