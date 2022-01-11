import 'dart:convert';

Perfil usuario(String str) {
  final jsonData = json.decode(str);
  return Perfil.fromJson(jsonData);
}

class Perfil {
  final String nombre;
  final String apellido;
  final String email;
  final String password;
  final String localidad;
  final int nota;

  Perfil(this.email, this.password, this.apellido, this.nombre, this.nota,
      this.localidad);

  Perfil.fromJson(Map<String, dynamic> json)
      : nombre = json['name'],
        apellido = json['username'],
        email = json['email'],
        password = json['password'],
        localidad = json['localidad'],
        nota = json['nota'];

  String toJson() => jsonEncode({
        'email': email,
        'password': password,
      });
}
