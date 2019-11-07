import 'package:flutter/material.dart';

class MuralEventos extends StatefulWidget {
  @override
  _MuralEventosState createState() => _MuralEventosState();
}

class _MuralEventosState extends State<MuralEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mural de Eventos"),
        backgroundColor: Color.fromARGB(255, 85, 51, 111),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Color.fromARGB(255, 85, 51, 111),
            elevation: 10.0,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                          'Festa da amizade'
                          "\n"
                          'Data:23/10/2019'
                          "\n"
                          'Horário: 6:45h',
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 85, 51, 111),
            elevation: 10.0,
            child: Container(
              height: 100.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'Festa do JECA'
                    "\n"
                    'Data:10/12/2019'
                    "\n"
                    'Horário: 21:00h',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
