import 'dart:convert';

List<Empresa> empresaFromJson(String str) =>
    List<Empresa>.from(json.decode(str).map((x) => Empresa.fromJson(x)));

String empresaToJson(List<Empresa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Empresa empresa(String str) =>
    Empresa.fromJson(json.decode(str).map((x) => Empresa.fromJson(x)));

loadEmpresa(String str) {
  final jsonData = json.decode(str);
  return Empresa.fromJson(jsonData);
}

class Empresa {
  final int id;
  final String name;
  final String Email;
  final String Direccion;
  final int ProvinciaId;
  final String localidad;

  Empresa(this.id, this.name, this.Email, this.Direccion, this.ProvinciaId,
      this.localidad);

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
      json['id'],
      json['name'],
      json['email'],
      json['direccion'],
      json['provinciaid'],
      json['localidad']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': Email,
        'provinciaId': ProvinciaId,
        'direccion': Direccion,
        'localidad': localidad,
      };
}
