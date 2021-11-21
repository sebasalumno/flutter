import 'dart:convert';

class Usuario {
  final String email;
  final String password;

  Usuario(this.email, this.password);

  Usuario.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  String toJson() => jsonEncode({
        'email': email,
        'password': password,
      });
}
