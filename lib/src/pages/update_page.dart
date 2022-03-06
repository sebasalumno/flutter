import 'dart:ffi';

import 'package:drawer/src/models/ciclo.dart';
import 'package:drawer/src/models/provincia.dart';
import 'package:drawer/src/models/update.dart';
import 'package:drawer/src/services/ciclo_service.dart';
import 'package:drawer/src/services/provincia_service.dart';
import 'package:drawer/src/services/update_service.dart';
import 'package:drawer/src/variables/variables_globales.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String _nombre = "";
  String _apellido = "";
  String _email = "";
  String _localidad = "";
  double _nota = 0;
  late Update _update;

  int dropdownProvinceValue = 1;
  int dropdownCicloValue = 1;

  ProvinciaService _provinciaService = new ProvinciaService();
  CicloService _cicloService = new CicloService();
  UpdateService _updateService = new UpdateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Cambia tu perfil'),
        shadowColor: Colors.green,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(40.0),
          children: <Widget>[
            _crearNewName(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearNewSurname(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            provincias(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearNewLocalidad(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearNewNota(),
            const Divider(
              height: 40.0,
              color: Colors.lightBlue,
            ),
            _crearBotonUpdate(),
          ],
        ),
      ),
    );
  }

  Widget _crearBotonUpdate() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.black),
        child: const Text("Register"),
        onPressed: () {
          _update = Update(userId, _email, _nombre, _apellido,
              dropdownProvinceValue, _localidad, _nota);
          _updateService.update(_update).then((response) {
            if (response.statusCode == 200) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Bien')));
              Navigator.pushNamed(context, 'home');
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('no')));
            }
          });
        });
  }

  Widget _crearNewName() {
    return TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'New Name',
            labelText: 'Name',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _nombre = valor;
            }));
  }

  Widget _crearNewNota() {
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
              _nota = double.parse(valor);
            }));
  }

  Widget _crearNewSurname() {
    return TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'New Surname',
            labelText: 'Surname',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _apellido = valor;
            }));
  }

  Widget _crearNewEmail() {
    return TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'New Email',
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

  Widget provincias() {
    return FutureBuilder(
        future: ProvinciaService().loadProvincias(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DropdownMenuItem<Provincia>> listaProvincias = [];
            for (var item in snapshot.data) {
              listaProvincias
                  .add(DropdownMenuItem(child: Text(item.nombre), value: item));
            }

            return DropdownButton<Provincia>(
              value: listaProvincias[dropdownProvinceValue - 1].value,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.blueGrey,
              ),
              onChanged: (Provincia? newValue) {
                setState(() {
                  dropdownProvinceValue = newValue!.id;
                });
              },
              items: listaProvincias,
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget ciclo() {
    return FutureBuilder(
        future: CicloService().loadCiclo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DropdownMenuItem<Ciclo>> listaCiclo = [];
            for (var item in snapshot.data) {
              listaCiclo
                  .add(DropdownMenuItem(child: Text(item.name), value: item));
            }
            return DropdownButton<Ciclo>(
              value: listaCiclo[dropdownCicloValue - 1].value,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.blueGrey,
              ),
              onChanged: (Ciclo? newValue) {
                setState(() {
                  dropdownCicloValue = newValue!.id;
                });
              },
              items: listaCiclo,
            );
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _crearNewLocalidad() {
    return TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'New Localidad',
            labelText: 'Localidad',
            labelStyle: const TextStyle(color: Colors.black),
            suffixIcon: const Icon(Icons.alternate_email),
            icon: const Icon(
              Icons.email,
              color: Colors.blueGrey,
            )),
        onChanged: (valor) => setState(() {
              _localidad = valor;
            }));
  }
}
