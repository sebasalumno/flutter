import 'dart:convert';
import 'dart:io';

import 'package:drawer/src/models/provincia.dart';

import 'package:http/http.dart' as http;

class ProvinciaService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/provincia/getall';

  Future<Provincia> login() async {
    final response = await http.get(Uri.parse(urlserver + controller),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    return Provincia.fromJson(jsonDecode(response.body));
  }
}
