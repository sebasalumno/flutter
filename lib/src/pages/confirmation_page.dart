import 'package:drawer/src/models/confirmation.dart';
import 'package:drawer/src/pages/login_page.dart';
import 'package:drawer/src/services/sendcode_service.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String _email = '';
  int _codigo = 0;
  bool _isValid = false;
  SendcodeService _sendcodeService = SendcodeService();
  late Confirmation _confirmation;
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
              _crearEmail(),
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
        ));
  }

  Widget _crearConfirmacionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: const Text("Confirmar"),
      onPressed: () {
        _isValid = _email.isNotEmpty && _codigo != 0;
        if (_isValid) {
          _confirmation = Confirmation(_email, _codigo);

          _sendcodeService.sendcode(_confirmation).then((response) {
            if (response.statusCode == 200) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('su cuenta ha sido confirmada')));
              Navigator.pushNamed(context, "/");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Codigo o email incorrecto')));
            }
          });
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
}
