
import 'dart:convert';

class Provincia {
  final int id;
  final String name;

  Provincia(this.id, this.name);
    Provincia.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  String toJson(jsonDecode) => jsonEncode({
        'id': id,
        'name': name,
      });
}