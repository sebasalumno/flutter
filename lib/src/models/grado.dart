import 'dart:convert';

List<Grado> gradoFromJson(String str) =>
    List<Grado>.from(json.decode(str).map((x) => Grado.fromJson(x)));

String gradoToJson(List<Grado> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

loadGrado(String str) {
  final jsonData = json.decode(str);
  return Grado.fromJson(jsonData);
}

class Grado {
  final int id;
  final String name;

  Grado(this.id, this.name);

  factory Grado.fromJson(Map<String, dynamic> json) =>
      Grado(json['id'], json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
