import 'dart:convert';

List<Mensaje> mensajeFromJson(String str) =>
    List<Mensaje>.from(json.decode(str).map((x) => Mensaje.fromJson(x)));

String mensajeToJson(List<Mensaje> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

loadMensaje(String str) {
  final jsonData = json.decode(str);
  return Mensaje.fromJson(jsonData);
}

class Mensaje {
  final int id;
  final int empresaId;
  final int usuarioId;
  final String message;

  Mensaje(
    this.id,
    this.usuarioId,
    this.empresaId,
    this.message,
  );

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
      json['id'], json['usuarioId'], json['empresaId'], json['message']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': usuarioId,
        'empresaId': empresaId,
        'descripcion': message
      };
}
