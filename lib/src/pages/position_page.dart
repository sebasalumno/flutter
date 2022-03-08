import 'package:drawer/src/models/inscription.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:drawer/src/services/empresa_service.dart';
import 'package:drawer/src/services/inscription_service.dart';
import 'package:drawer/src/services/position_service.dart';
import 'package:drawer/src/variables/variables_globales.dart';
import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  @override
  _positionPageState createState() => _positionPageState();
}

LoginPage _login = new LoginPage();
String _id = _login.AlumnoId().toString();

class _positionPageState extends State<PositionPage> {
  late Inscription _inscription;
  PositionService _positionService = new PositionService();
  EmpresaService _empresaService = new EmpresaService();
  InscriptionService _inscriptionService = new InscriptionService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Posiciones de trabajo'),
        ),
        body: FutureBuilder(
            future: _positionService.loadPosition(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView(children: ofertas(snapshot.data));
            }));
  }

  List<Card> ofertas(List<dynamic> data) {
    List<Card> offers = [];

    data.forEach((element) {
      offers.add(Card(
          child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.wallet_travel),
            title: Text(element.Nombre),
            subtitle: const Text("nombre de la empresa"),
          ),
          ListTile(
              subtitle:
                  Text("Descripcion de la oferta : " + element.Descripcion)),
          ListTile(subtitle: Text("Horario : " + element.Horario)),
          ListTile(
              subtitle:
                  Text("Remuneracion : " + element.Remuneracion.toString())),
          //FutureBuilder(builder: builder), of ciclos
          Row(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: const Text("Detalles")),
              TextButton(
                  onPressed: () {
                    _inscription = Inscription(
                        int.parse(_id) //(Variable Global)
                        ,
                        element.Id,
                        0);
                    _inscriptionService
                        .inscribirse(_inscription)
                        .then((response) {
                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(element.Id.toString())));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(element.Id.toString())));
                      }
                    });
                  },
                  child: const Text("Inscribirte"))
            ],
          )
        ],
      )));
    });

    return offers;
  }
}
