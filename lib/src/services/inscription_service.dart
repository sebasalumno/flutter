import 'dart:io';

import 'package:drawer/src/models/inscription.dart';

import 'package:http/http.dart' as http;

class InscriptionService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/inscripciones/create';

  Future<http.Response> inscribirse(Inscription inscription) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: inscription.toJson(),
    );
  }
}
