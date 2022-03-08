import 'dart:io';

import 'package:drawer/src/models/provincia.dart';
import 'package:http/http.dart' as http;

class ProvinciaService {
  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/provincia/obtainall';

  Future<List<Provincia>> loadProvincias() async {
    final response = await http.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return provinciaFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
