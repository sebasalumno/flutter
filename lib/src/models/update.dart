import 'dart:convert';

class Update {
  final int id;
  final String email;
  final String name;
  final String surname;

  final int provincia;
  final String localidad;
  final double nota;
  //final DateTime nacimiento;

  Update(
    this.id,
    this.email,
    this.name,
    this.surname,
    this.provincia,
    this.localidad,
    this.nota,
  );

  Update.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        name = json['name'],
        surname = json['username'],
        provincia = json['provinciaid'],
        localidad = json['localidad'],
        nota = json['nota'];

  String toJson() => jsonEncode({
        'id': id,
        'email': email,
        'name': name,
        'username': surname,
        'provinciaid': provincia,
        'localidad': localidad,
        'nota': nota
      });
}
