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

  List<Widget> _crearItems() {
    List<Widget> items = [];

    for (String opt in menu) {
      final tempWidget = ListTile(title: Text(opt));
      items.add(tempWidget);
    }
    return items;
  }

  List<Widget> _crearItemsCorto(context) {
    return menu.map((item) {
      return ListTile(
        title: Text(item),
        onTap: () {
          final ruta = MaterialPageRoute(builder: (context) => MyAlertPage());
          Navigator.push(context, ruta);
        },
      );
    }).toList();
  }
}
