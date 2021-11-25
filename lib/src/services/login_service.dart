import 'package:drawer/src/models/usuario.dart';
import 'package:http/http.dart' as http;

class LoginService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/usuario/login';

  Future<http.Response> login(Usuario usuario) {
    return http.post(Uri.parse(urlserver + controller),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: usuario.toJson());
  }
}