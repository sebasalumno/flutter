import 'package:drawer/src/methods/authclient.dart';
import 'package:drawer/src/models/mensaje.dart';

import 'package:http/http.dart' as http;

class MensajeService {
  final AuthHttpClient authHttpClient = AuthHttpClient();

  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/Usuario/GetMessage?id=';

  Future<List<Mensaje>> loadMensaje(String id) async {
    final response =
        await authHttpClient.get(Uri.parse(urlserver + controller + id));
    if (response.statusCode == 200) {
      return mensajeFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
