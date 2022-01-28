import 'dart:convert';

ConfirmChange confirmChanger(String str) {
  final jsonData = json.decode(str);
  return ConfirmChange.fromJson(jsonData);
}

class ConfirmChange {
  final String password;
  final int codigo;

  ConfirmChange(this.password, this.codigo);

  ConfirmChange.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        codigo = json['codigo'];

  String toJson() => jsonEncode({'password': password, 'codigo': codigo});
}
