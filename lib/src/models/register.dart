import 'dart:convert';

class Register {
  final String email;
  final String name;
  final String surname;
  final String password;
  final int provincia;
  final String localidad;
  final int grado;
  final int familia;
  final int ciclo;
  final double nota;
  final bool confirmado;
  //final DateTime nacimiento;

  Register(
    this.email,
    this.name,
    this.surname,
    this.password,
    this.provincia,
    this.localidad,
    this.grado,
    this.familia,
    this.ciclo,
    this.nota,
    this.confirmado
  );

  Register.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        surname = json['username'],
        password = json['password'],
        provincia = json['provinciaid'],
        localidad = json['localidad'],
        grado = json['tipocicloid'],
        familia = json['familiaid'],
        ciclo = json['cicloid'],
        nota = json['nota'],
        confirmado = json['confirmado'];

  String toJson() => jsonEncode({
        'email': email,
        'name': name,
        'username': surname,
        'password': password,
        'provinciaid': provincia,
        'localidad': localidad,
        'tipocicloid': grado,
        'cicloid': ciclo,
        'nota': nota,
        'confirmado':confirmado
      });
}
