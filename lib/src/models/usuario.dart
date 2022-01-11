import 'dart:convert';

Usuario usuario(String str) {
  final jsonData = json.decode(str);
  return Usuario.fromJson(jsonData);
}

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
