import 'dart:convert';

List<Ciclo> cicloFromJson(String str) =>
    List<Ciclo>.from(json.decode(str).map((x) => Ciclo.fromJson(x)));

String cicloToJson(List<Ciclo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

loadCiclo(String str) {
  final jsonData = json.decode(str);
  return Ciclo.fromJson(jsonData);
}

class Ciclo {
  final int id;
  final String name;
  final int tipoCicloId;
  final int familiaId;

  Ciclo(this.id, this.name, this.tipoCicloId, this.familiaId);

  factory Ciclo.fromJson(Map<String, dynamic> json) =>
      Ciclo(json['id'], json['name'], json['tipoCicloId'], json['familiaId']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tipoCicloId': tipoCicloId,
        'familiaId': familiaId
      };
}
