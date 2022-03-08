import 'package:drawer/src/models/confirmation.dart';
import 'package:drawer/src/models/usuario.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:drawer/src/services/iniciarpasswordchanger_service.dart';
import 'package:drawer/src/services/sendcode_service.dart';
import 'package:drawer/src/services/usuario_service.dart';
import 'package:flutter/material.dart';

class RecoverPage extends StatefulWidget {
  @override
  _RecoverPageState createState() => _RecoverPageState();
}

class _RecoverPageState extends State<RecoverPage> {
  String _email = '';
  bool _isValid = false;
  String _password = '';
  UsuarioService _usuarioService = UsuarioService();
  IniciarPasswordService _iniciarPasswordService = IniciarPasswordService();
  late Usuario _usuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Recupera tu contraseña'),
          shadowColor: Colors.green,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(40.0),
            children: <Widget>[
              _crearEmail(),
              const Divider(
                height: 40.0,
                color: Colors.lightBlue,
              ),
              _crearConfirmacionButton()
            ],
          ),
        ));
  }

  Widget _crearConfirmacionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: const Text("Confirmar"),
      onPressed: () {
        _isValid = _email.isNotEmpty;
        if (_isValid) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Rellene los campos')));
        }
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }
}
