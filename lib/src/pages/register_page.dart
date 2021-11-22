import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<RegisterPage> {
  String _email = '';
  String _password = '';
  String _nombre = '';
  String dropdownValue = 'provincias';
  String _localidad = '';
  String dropdownValueGrados = 'Grados';
  String dropdownValueCiclo = 'Ciclo';
  String _nota = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Registrate'),
          shadowColor: Colors.green,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(40.0),
            children: <Widget>[
              _crearEmail(),
              const Divider(
                height: 20.0,
                color: Colors.lightBlue,
              ),
              _Crearnombre(),
              const Divider(
                height: 20.0,
                color: Colors.lightBlue,
              ),
              _crearPassword(),
              const Divider(
                height: 10.0,
                color: Colors.lightBlue,
              ),
              _CrearProvincias(),
              const Divider(
                height: 20.0,
                color: Colors.lightBlue,
              ),
              _Crearlocalidad(),
              const Divider(
                height: 10.0,
                color: Colors.lightBlue,
              ),
              _CrearGrados(),
              const Divider(
                height: 10.0,
                color: Colors.lightBlue,
              ),
              _CrearCiclos(),
              const Divider(
                height: 20.0,
                color: Colors.lightBlue,
              ),
              _CrearNota(),
              const Divider(
                height: 20.0,
                color: Colors.lightBlue,
              ),
              _crearBotonRegister()
            ],
          ),
        ));
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

  /*
Este metodo crea y decora el Textfield del nombre
*/
  Widget _Crearnombre() {
    return TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'nombre',
            labelText: 'nombre',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.account_circle),
            icon: const Icon(
              Icons.account_circle,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

/*
 * Este metodo crear y decora(relativamente) el dropdown de Provincias;
 */
  Widget _CrearProvincias() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['provincias', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /*
Este metodo crea y decora el Textfield de la localidad
*/
  Widget _Crearlocalidad() {
    return TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'localidad',
            labelText: 'localidad',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.location_city_outlined),
            icon: const Icon(
              Icons.location_city_outlined,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _localidad = valor;
            }));
  }

/*
 * Este metodo crear y decora(relativamente) el dropdown de grados;
 */
  Widget _CrearGrados() {
    return DropdownButton<String>(
      value: dropdownValueGrados,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueGrados = newValue!;
        });
      },
      items: <String>['Grados', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

/*
 * Este metodo crear y decora(relativamente) el dropdown de ciclos;
 */
  Widget _CrearCiclos() {
    return DropdownButton<String>(
      value: dropdownValueCiclo,
      icon: const Icon(Icons.arrow_drop_down_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueCiclo = newValue!;
        });
      },
      items: <String>['Ciclo', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  /*
Este metodo crea y decora el boton register
*/
  Widget _crearBotonRegister() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: const Text("Register"),
      onPressed: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Bien')));
      },
    );
  }

/*
*Este metodo crea y decora el campo de nota media 
*/
  Widget _CrearNota() {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'nota',
            labelText: 'nota',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.school_rounded),
            icon: const Icon(
              Icons.school_rounded,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _nota = valor;
            }));
  }

  /*
Este metodo crear y decora el Textfield de contraseñas
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
