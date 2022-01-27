import 'dart:io';

import 'package:drawer/src/methods/authclient.dart';
import 'package:drawer/src/models/inscription.dart';

import 'package:http/http.dart' as http;

class InscriptionService {
  final AuthHttpClient authHttpClient = AuthHttpClient();
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/inscripciones/create';

  Future<http.Response> inscribirse(Inscription inscription) {
    return authHttpClient.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: inscription.toJson(),
    );
  }
}
