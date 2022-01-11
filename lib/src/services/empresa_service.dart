import 'dart:io';

import 'package:drawer/src/models/empresa.dart';
import 'package:http/http.dart' as http;

class EmpresaService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/empresa/Get?id=';

  Future<Empresa> GetNombreEmpresa(String id) async {
    final response = await http.get(Uri.parse(urlserver + controller + id));
    if (response.statusCode == 200) {
      return empresa(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
