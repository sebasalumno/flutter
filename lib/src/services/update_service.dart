import 'dart:io';

import 'package:drawer/src/models/update.dart';
import 'package:http/http.dart' as http;

class UpdateService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/usuario/Actualizar';

  Future<http.Response> update(Update register) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: register.toJson(),
    );
  }
}
