import 'package:drawer/src/models/usuario.dart';
import 'package:drawer/src/services/login_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  late Usuario _usuario;

  LoginService _loginService = new LoginService();

  String _opcionSeleccionada = 'Volar';

  final List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Aliento',
    'Super Fuerza'
  ];

  final TextEditingController _inputFieldDateController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Bienvenido'),
          shadowColor: Colors.green,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(40.0),
            children: <Widget>[
              _crearEmail(),
              const Divider(),
              _crearPassword(),
              const Divider(),
              _crearBotonLogin(),
              const Divider()
            ],
          ),
        ));
  }

  Widget _crearBotonLogin() {
    return ElevatedButton(
      child: const Text("Login"),
      onPressed: () {
        _usuario = Usuario(_email, _password);
        _loginService
            .login(_usuario)
            .then((onValue) => {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Bienvenido')))
                })
            .catchError((onError) => {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Cagaste')))
                });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email',
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(
              Icons.lock,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }
}
