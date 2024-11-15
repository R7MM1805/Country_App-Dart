import 'package:http/http.dart' as http;

class ServiceConnector {
  static Future<String?> getService(String url) async {
    Uri newUrl = Uri.parse(url);
    http.Response? response = await http.get(newUrl, headers: {'Accept': 'application/json; charset=utf-8'});
    return (response.statusCode == 200)
        ? response.body
        : 'Ocurrió un problema con la conexión al servicio';
  }
}
