import 'package:drawer/src/models/familia.dart';
import 'package:http/http.dart' as http;

class FamiliaService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/Familias/GetAll';

  Future<List<Familia>> loadFamilia() async {
    final response = await http.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return familiaFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
