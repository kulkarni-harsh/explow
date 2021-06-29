import 'package:explow/model/Show.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static const String _baseUrl = "imdb8.p.rapidapi.com";
  static const _api_key = '9c3e69e1d1msh207fde56b7dc8d7p15f31bjsn0f41dba62f0f';
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "imdb8.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };

  static Future<List<Result>?> getapi(String showName) async {
    Uri url = Uri.https(_baseUrl, "/title/find", {"q": showName});

    final response = await http.get(url, headers: _headers);
    if (response.statusCode != 200) {
      return [];
    }
    var rep = showFromJson(response.body);

    return rep.results;
  }
}
