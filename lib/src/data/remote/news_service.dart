import 'package:http/http.dart' as http;
import 'package:news_repo_pattern/src/data/model/news_model.dart';
import 'package:news_repo_pattern/src/data/remote/data_state.dart';

class NewsService {
  final String _baseUrl = 'https://newsapi.org/v2/everything';

  Future getNews() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return Success(code: 200, message: newsModelFromJson(response.body));
      }
    } catch (e) {}
  }
}
