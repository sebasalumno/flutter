import 'dart:convert';

List<Familia> familiaFromJson(String str) =>
    List<Familia>.from(json.decode(str).map((x) => Familia.fromJson(x)));

String familiaToJson(List<Familia> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

loadGrado(String str) {
  final jsonData = json.decode(str);
  return Familia.fromJson(jsonData);
}

class Familia {
  final int id;
  final String name;

  Familia(this.id, this.name);

  factory Familia.fromJson(Map<String, dynamic> json) =>
      Familia(json['id'], json['name']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
