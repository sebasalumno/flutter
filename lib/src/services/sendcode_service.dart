import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class SendcodeService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/confirmacion/confirmacion';

  Future<http.Response> sendcode(String email, int codigo) {
    return http.put(Uri.parse(urlserver + controller),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({
          "email": email,
          "codigo": codigo,
        }));
  }
}
