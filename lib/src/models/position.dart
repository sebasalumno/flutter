import 'dart:convert';

List<Position> positionFromJson(String str) =>
    List<Position>.from(json.decode(str).map((x) => Position.fromJson(x)));

String positionToJson(List<Position> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

loadPosition(String str) {
  final jsonData = json.decode(str);
  return Position.fromJson(jsonData);
}

class Position {
  final int Id;
  final int EmpresaId;
  final String Nombre;
  final String Descripcion;
  final String Horario;
  final int Remuneracion;
  //final DAteTime Fecha_Inicio;
  //final DateTime Fecha_Fin;

  Position(this.Id, this.Nombre, this.EmpresaId, this.Descripcion, this.Horario,
      this.Remuneracion);

  factory Position.fromJson(Map<String, dynamic> json) => Position(
      json['id'],
      json['nombre'],
      json['empresaId'],
      json['descripcion'],
      json['horario'],
      json['remuneracion']);

  Map<String, dynamic> toJson() => {
        'id': Id,
        'nombre': Nombre,
        'empresaId': EmpresaId,
        'descripcion': Descripcion,
        'horario': Horario,
        'remuneracion': Remuneracion
      };
}
