import 'package:explow/model/News.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static var client = http.Client();
  static Future<List<Article>?> getapi(String country) async {
    String _url =
        "https://saurav.tech/NewsAPI/top-headlines/category/entertainment/${country}.json";
    Uri uri = Uri.parse(_url);
    final response = await http.get(uri);
    var rep = newsFromJson(response.body);
    for (int i = 0; i < rep.articles!.length; i++) {
      print(rep.articles![i].urlToImage);
    }
    return rep.articles;
  }
}
