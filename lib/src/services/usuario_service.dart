import 'dart:io';


import 'package:drawer/src/models/perfil.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/Usuario/GetUser?id=';

  Future<Perfil> getUsuario(String id) async {
    final response = await http.get(Uri.parse(urlserver + controller + id));
    if (response.statusCode == 200) {
      return usuario(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
