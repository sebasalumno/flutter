import 'package:drawer/src/models/inscription.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:drawer/src/services/empresa_service.dart';
import 'package:drawer/src/services/inscription_service.dart';
import 'package:drawer/src/services/mensaje_service.dart';
import 'package:drawer/src/services/position_service.dart';
import 'package:drawer/src/variables/variables_globales.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _messagePageState createState() => _messagePageState();
}

LoginPage _login = new LoginPage();
String _id = _login.AlumnoId().toString();

class _messagePageState extends State<MessagePage> {
  late Inscription _inscription;
  MensajeService _mensajeService = new MensajeService();
  EmpresaService _empresaService = new EmpresaService();
  InscriptionService _inscriptionService = new InscriptionService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Mensajes de empresas'),
        ),
        body: FutureBuilder(
            future: _mensajeService.loadMensaje(_id), //Metodo de mensages
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(children: mensages(snapshot.data));
            }));
  }

  List<Card> mensages(List<dynamic> data) {
    List<Card> offers = [];

    data.forEach((element) {
      offers.add(Card(
          child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.message),
            title: Text(element.empresaId.toString()),
            subtitle: const Text("De la empresa"),
          ),
          ListTile(
              subtitle:
                  Text("Para el usuario : " + element.usuarioId.toString())),
          ListTile(subtitle: Text("Mensaje : " + element.message.toString())),

          //FutureBuilder(builder: builder), of ciclos
        ],
      )));
    });

    return offers;
  }
}
