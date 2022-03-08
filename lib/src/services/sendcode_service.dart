import 'dart:convert';
import 'dart:io';

import 'package:drawer/src/models/confirmation.dart';
import 'package:http/http.dart' as http;

class SendcodeService {
  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/confirmacion/confirmacion';

  Future<http.Response> sendcode(Confirmation confirmation) {
    return http.post(
      Uri.parse(urlserver + controller),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: confirmation.toJson(),
    );
  }
}
