import 'package:drawer/src/models/grado.dart';

import 'package:http/http.dart' as http;

class GradoService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/TipoCiclo/GetAll';

  Future<List<Grado>> loadGrado() async {
    final response = await http.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return gradoFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
