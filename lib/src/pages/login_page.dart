import 'dart:ffi';

import 'package:drawer/src/models/usuario.dart';
import 'package:drawer/src/services/id_service.dart';
import 'package:drawer/src/services/login_service.dart';
import 'package:drawer/src/services/storage_service.dart';
import 'package:drawer/src/variables/variables_globales.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

  int AlumnoId() {
    return idusuario;
  }
}

int idusuario = 1;

class _LoginPageState extends State<LoginPage> {
  bool _isValid = true;
  String _nombre = '';
  String _email = '';
  String _password = '';
  late Usuario _usuario;

  LoginService _loginService = new LoginService();
  IdService _idService = new IdService();
  StorageService _storageService = new StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Bienvenido'),
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
              _crearPassword(),
              const Divider(
                height: 40.0,
                color: Colors.lightBlue,
              ),
              _crearBotonLogin(),
              const Divider(
                height: 40.0,
                color: Colors.lightBlue,
              ),
              _crearTextRegister(),
              const Divider(
                height: 40.0,
                color: Colors.lightBlue,
              ),
              _crearTextConfirmation(),
              const Divider(
                height: 40.0,
                color: Colors.lightBlue,
              ),
              _crearTextRecover()
            ],
          ),
        ));
  }

/*
Este metodo crea el texto de registro y hace que sea clickable
*/
  Widget _crearTextRegister() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
            text: '??No tienes cuenta?  ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
              text: 'Reg??strate',
              style: const TextStyle(
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, "register");
                })
        ]),
      ),
    );
  }

  Widget _crearTextConfirmation() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
            text: 'Confirma tu cuenta   ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
              text: 'Aqu??',
              style: const TextStyle(
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, "confirmation");
                })
        ]),
      ),
    );
  }

  Widget _crearTextRecover() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          const TextSpan(
            text: 'Recupera tu contrase??a:   ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
              text: 'Aqu??',
              style: const TextStyle(
                color: Colors.white,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, "recover");
                })
        ]),
      ),
    );
  }

/*
Este metodo crea y decora el boton login
*/
  Widget _crearBotonLogin() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        child: const Text("Login"),
        onPressed: () {
          _isValid = _email.isNotEmpty && _password.isNotEmpty;
          if (_isValid) {
            _usuario = Usuario(_email, _password);

            _loginService.login(_usuario).then((response) {
              if (response.statusCode == 200) {
                _idusuario();
                _storageService.add("authorization",
                    response.headers['authorization'].toString());
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: _idusuario()));
                Navigator.pushNamed(context, 'home');
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Cagaste')));
              }
            }).catchError((onError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Error')));
            });
          }
        });
  }

/*
Este metodo crea y decora el Textfield del email
*/
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

  Widget _idusuario() {
    return FutureBuilder(
        future: IdService().loadId(_email),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            idusuario = snapshot.data.id;

            return Text(idusuario.toString());
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            return const Text('else');
          }
        });
  }

/*
Este metodo crear y decora el Textfield de contrase??as
*/
  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.lock_open),
            icon: const Icon(
              Icons.lock,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }
}
