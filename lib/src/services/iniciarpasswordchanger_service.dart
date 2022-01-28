import 'dart:convert';
import 'dart:io';

import 'package:drawer/src/models/passwordchanger.dart';
import 'package:http/http.dart' as http;

class IniciarPasswordService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/confirmacion/IniciarContrasenaUsuario';

  Future<http.Response> sendcode(PasswordChanger passwordChanger) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: passwordChanger.toJson(),
    );
  }
}
