import 'package:drawer/src/models/position.dart';
import 'package:http/http.dart' as http;

class PositionService {
  final urlserver = 'http://10.0.2.2:5000';
  final controller = '/api/Offer/GetAll';

  Future<List<Position>> loadPosition() async {
    final response = await http.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return positionFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
