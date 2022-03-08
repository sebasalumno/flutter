import 'package:drawer/src/methods/authclient.dart';
import 'package:drawer/src/models/position.dart';
import 'package:http/http.dart' as http;

class PositionService {
  final AuthHttpClient authHttpClient = AuthHttpClient();
  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/Offer/GetAll';

  Future<List<Position>> loadPosition() async {
    final response =
        await authHttpClient.get(Uri.parse(urlserver + controller));
    if (response.statusCode == 200) {
      return positionFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
