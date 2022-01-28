import 'package:drawer/src/models/confirmchange.dart';
import 'package:drawer/src/services/changepassword_service.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String _password = '';
  String _passwordR = '';
  int _codigo = 0;
  bool _isValid = false;
  late ConfirmChange _change;
  ChangePasswordService _changePasswordService = ChangePasswordService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Confirma tu cuenta'),
        shadowColor: Colors.green,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(40.0),
          children: <Widget>[
            _crearPassword(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearPasswordR(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearCodigo(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearConfirmacionButton()
          ],
        ),
      ),
    );
  }

  Widget _crearCodigo() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Codigo',
            labelText: 'Codigo',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.vpn_key),
            icon: const Icon(
              Icons.vpn_key,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _codigo = int.parse(valor);
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'New Password',
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  Widget _crearPasswordR() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Repeat Password',
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _passwordR = valor;
            }));
  }

  Widget _crearConfirmacionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: const Text("Cambiar"),
      onPressed: () {
        _isValid = _password.isNotEmpty &&
            _passwordR.isNotEmpty &&
            _codigo != 0 &&
            _password == _passwordR;

        if (_isValid) {
          _change = ConfirmChange(_password, _codigo);
          _changePasswordService.change(_change).then((response) {
            if (response.statusCode == 200) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('su cuenta ha sido actualizada')));
              Navigator.pushNamed(context, "/");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Codigo incorrecto o las contraseñas no coinciden ')));
            }
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Rellene los campos')));
        }
      },
    );
  }
}
