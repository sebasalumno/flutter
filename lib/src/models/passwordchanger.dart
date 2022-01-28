// ignore_for_file: file_names

import 'dart:convert';

PasswordChanger passwordChanger(String str) {
  final jsonData = json.decode(str);
  return PasswordChanger.fromJson(jsonData);
}

class PasswordChanger {
  final int id;

  PasswordChanger(this.id);

  PasswordChanger.fromJson(Map<String, dynamic> json) : id = json['id'];

  String toJson() => jsonEncode({'id': id});
}
