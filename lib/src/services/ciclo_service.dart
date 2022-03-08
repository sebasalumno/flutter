import 'package:drawer/src/models/ciclo.dart';
import 'package:drawer/src/models/familia.dart';
import 'package:http/http.dart' as http;

class CicloService {
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/Ciclo/GetAll';
  //final urlserver = 'http://10.0.2.2:5000';
  //final controller = '/api/Ciclo/GetAll';

  Future<List<Ciclo>> loadCiclo() async {
    final response = await http.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return cicloFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
