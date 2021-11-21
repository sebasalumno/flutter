import 'package:drawer/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

import '../providers/menu_provider.dart';

class MyHomePage extends StatelessWidget {
  final List<String> menu = ['Alerta', 'Segunda', 'Tercera'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('mi app'),
        ),
        drawer: Drawer(child: _lista()),
        body: const Center(
          child: Text('No hay nada aqui... Aún'),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

/*
Este metodo inserta en la lista las rutas y las paginas a las que se dirigen desde un provider
*/

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaitem(snapshot.data, context),
        );
      },
    );
  }

/*
Este es un submetodo que asiste al metodo anterior y les asigna a cada uno una ruta y crea la lista
*/
  List<Widget> _listaitem(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((ruta) {
      final tempWidget = ListTile(
        title: Text(ruta['texto']),
        onTap: () {
          Navigator.pushNamed(context, ruta["ruta"]);
        },
      );
      opciones.add(tempWidget);
    });
    return opciones;
  }
}
