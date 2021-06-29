import 'package:explow/model/Info.dart';
import 'package:http/http.dart' as http;

class InfoApi {
  static var client = http.Client();
  static const String _baseUrl = "http://www.omdbapi.com/?i=";
  static const String _apiKey = "bd16e114";

  static Future<Info> getapi(String s) async {
    Uri url = Uri.parse("${_baseUrl}${s}&apikey=${_apiKey}&plot=full");
    final response = await http.get(url);
    var rep = infoFromJson(response.body);
    print(rep.title);
    return rep;
  }
}
