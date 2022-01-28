import 'dart:convert';
import 'dart:io';

import 'package:drawer/src/models/confirmchange.dart';

import 'package:http/http.dart' as http;

class ChangePasswordService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/confirmacion/CambiarContrasenaUsuario';

  Future<http.Response> change(ConfirmChange confirmChange) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: confirmChange.toJson(),
    );
  }
}
