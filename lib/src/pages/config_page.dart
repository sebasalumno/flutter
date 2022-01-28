import 'package:drawer/src/models/passwordchanger.dart';
import 'package:drawer/src/services/iniciarpasswordchanger_service.dart';
import 'package:drawer/src/variables/variables_globales.dart';
import 'package:flutter/material.dart';

class MyConfigPage extends StatefulWidget {
  @override
  _configPageState createState() => _configPageState();
}

class _configPageState extends State<MyConfigPage> {
  PasswordChanger _passwordChanger = PasswordChanger(userId);
  IniciarPasswordService _iniciarPasswordService = IniciarPasswordService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Mi cuenta'),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            miCardImage('hey', Icons.settings, 'Mis ajustes'),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            myPasswordChangers(
                Icons.contact_page, 'Enviar email para cambiar  contraseña'),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            changePassword(Icons.article, "Cambiar contraseña")
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

  Card myPasswordChangers(IconData icon, String texto2) {
    return Card(
        color: Colors.lightBlue,
        child: ListTile(
          onTap: () {
            _iniciarPasswordService.sendcode(_passwordChanger).then((response) {
              if (response.statusCode == 200) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Se te ha enviado un correo')));
                Navigator.pushNamed(context, "changepage");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('El usuario ¿¡no existe!?')));
              }
            });
          },
          leading: Icon(icon),
          title: Text(texto2),
        ));
  }

  Card changePassword(IconData icon, String texto2) {
    return Card(
        color: Colors.lightBlue,
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, "changepage");
          },
          leading: Icon(icon),
          title: Text(texto2),
        ));
  }
}
