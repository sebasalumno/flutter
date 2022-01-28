import 'dart:convert';

Confirmation confirmation(String str) {
  final jsonData = json.decode(str);
  return Confirmation.fromJson(jsonData);
}

class Confirmation {
  final String email;
  final int codigo;

  Confirmation(this.email, this.codigo);

  Confirmation.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        codigo = json['codigo'];

  String toJson() => jsonEncode({
        'email': email,
        'codigo': codigo,
      });
}
