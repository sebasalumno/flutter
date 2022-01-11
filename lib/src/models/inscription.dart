import 'dart:convert';

class Inscription {
  final int alumnoid;
  final int ofertaid;
  //final DateTime Fechainscription;
  final int estado;

  Inscription(this.alumnoid, this.ofertaid, this.estado);

  Inscription.fromJson(Map<String, dynamic> json)
      : alumnoid = json['alumnoid'],
        ofertaid = json['useofertaidrname'],
        estado = json['estado'];
  //Fechainscription = json['provinciaid'],

  String toJson() => jsonEncode({
        'alumnoid': alumnoid,
        'ofertaid': ofertaid,
        //'Fechainscription': Fechainscription,
        'estado': estado
      });
}
