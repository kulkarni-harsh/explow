import 'package:explow/model/Show.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static const String _baseUrl = "imdb8.p.rapidapi.com";
  static const _api_key = '070ee1db21msh73587f00f3e7364p17d29fjsnb60908bccb8c';

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
