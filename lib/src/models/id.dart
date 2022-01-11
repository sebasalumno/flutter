import 'dart:convert';

Idclass id(String str) {
  final jsonData = json.decode(str);
  return Idclass.fromJson(jsonData);
}

class Idclass {
  final int id;

  Idclass(this.id);

  factory Idclass.fromJson(Map<String, dynamic> json) => Idclass(
        json['id'],
      );

  Map<String, dynamic> toJson() => {'id': id};
}
