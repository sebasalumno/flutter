import 'package:drawer/src/methods/authclient.dart';
import 'package:drawer/src/models/id.dart';
import 'package:http/http.dart' as http;

class IdService {
  //final urlserver = 'http://10.0.2.2:5000';
  final urlserver = 'http://51.254.98.198';
  final controller = '/api/Usuario/GetId?email=';

  Future<Idclass> loadId(String email) async {
    final AuthHttpClient authHttpClient = AuthHttpClient();
    var response =
        await authHttpClient.get(Uri.parse(urlserver + controller + email));
    if (response.statusCode == 200) {
      return id(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
