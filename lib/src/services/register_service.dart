import 'dart:io';

import 'package:drawer/src/models/register.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/usuario/create';

  Future<http.Response> register(Register register) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: register.toJson(),
    );
  }
}
