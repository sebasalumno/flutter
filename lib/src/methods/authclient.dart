import 'package:drawer/src/services/storage_service.dart';
import 'package:http/http.dart' as http;

class AuthHttpClient extends http.BaseClient {
  final StorageService storageService = StorageService();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = 'Bearer ' + await storageService.read('token');
    if (token.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => token);
    }

    return request.send();
  }
}
