import 'package:flutter/material.dart';

class MyConfigPage extends StatefulWidget {
  @override
  _configPageState createState() => _configPageState();
}

class _configPageState extends State<MyConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Mi Perfil'),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            miCardImage('hey', Icons.settings, 'Mis ajustes'),
          ]),
    );
  }

  Card miCardImage(String texto, IconData icon, String texto2) {
    return Card(
        color: Colors.lightBlue,
        child: ListTile(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(texto)));
          },
          leading: Icon(icon),
          title: Text(texto2),
        ));
  }
}
