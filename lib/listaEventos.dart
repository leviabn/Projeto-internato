import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListaEventos extends StatefulWidget {
  @override
  _ListaEventosState createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  String events;
  int rodar;
  List<String> muralEvents = List<String>();
  

  final _scaffoldState = GlobalKey<ScaffoldState>();

  void trazerDados() async {
    QuerySnapshot snapshot =
        await Firestore.instance.collection('eventos').getDocuments();

    for (DocumentSnapshot doc in snapshot.documents) {
      
      muralEvents.add(
          '${doc.data['local']}\n${doc.data['data']}\n${doc.data['descrição']}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      trazerDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text(
          'Mural de eventos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 85, 51, 111),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('eventos').getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: muralEvents.length,
              itemBuilder: (context, index) {
                this.events = muralEvents[index];
                this.rodar = index;
                return Card(
                  color: Color.fromARGB(255, 85, 51, 111),
                  elevation: 10.0,
                  child: GestureDetector(
                    child: Text(
                      events,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      if (index == 0) {
                        final snackBar = SnackBar(
                            content: ButtonBar(
                              children: <Widget>[
                                InkWell(
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        child: Text(
                                          "EDITAR",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.greenAccent),
                                        ),
                                        onTap: () {
                                          editar();
                                        },
                                        splashColor: Colors.tealAccent,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 1, 1, 1),
                                      ),
                                      InkWell(
                                          child: Text(
                                            "APAGAR",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: Colors.red),
                                          ),
                                          onTap: () async {
                                          },
                                          splashColor: Colors.redAccent)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            backgroundColor: Colors.white);
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else if (index == 1) {
                        final snackBar = SnackBar(
                            content: ButtonBar(
                              children: <Widget>[
                                InkWell(
                                  child: Row(
                                    children: <Widget>[
                                      InkWell(
                                        child: Text(
                                          "EDITAR",
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              color: Colors.greenAccent),
                                        ),
                                        onTap: () {
                                          editar();
                                        },
                                        splashColor: Colors.tealAccent,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 1, 1, 1),
                                      ),
                                      InkWell(
                                          child: Text(
                                            "APAGAR",
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: Colors.red),
                                          ),
                                           onTap: () async {
                                          },
                                          splashColor: Colors.redAccent)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            backgroundColor: Colors.white);
                        Scaffold.of(context).showSnackBar(snackBar);
                      } else if (index == 2) {
                      } else if (index == 3) {
                      } else if (index == 4) {
                      } else if (index == 5) {}
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> editar() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Text(
                        'Editar Evento:',
                      ),
                      onTap: () {}),
                  TextField(
                    //controller: _esqueceuSenhaController,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    onChanged: (String value) {
                      if (rodar == muralEvents[0]) {
                        muralEvents[0] = value;
                      } else if (rodar == muralEvents[1]) {
                        muralEvents[1] = value;
                      }
                    },
                  ),
                  Text('\n'),
                  GestureDetector(
                      child: RaisedButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      _scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text("Funcionol!"),
                        backgroundColor: Colors.red[500],
                        duration: Duration(seconds: 2),
                      ));
                      // final snackBar = SnackBar(
                      //   content: ButtonBar(),
                      // );
                      // Scaffold.of(context).showSnackBar(snackBar);
                    },
                  )),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.cyan,
          );
        });
  }
}
