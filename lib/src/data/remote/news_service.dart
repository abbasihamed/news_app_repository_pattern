import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:news_repo_pattern/src/data/model/news_model.dart';
import 'package:news_repo_pattern/src/data/remote/data_state.dart';

class NewsService {
  final String _baseUrl = 'https://newsapi.org/v2/everything';
  final String _apiKey = 'add7568a5b2c45f58c08537252f49488';

  Future getNews() async {
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl?q=tesla&from=2023-04-09&sortBy=publishedAt&apiKey=$_apiKey'));
      if (response.statusCode == 200) {
        return Success(code: 200, message: newsModelFromJson(response.body));
      }
      return Failed(code: 404,message: 'Response not valid');
    } on HttpException {
      return Failed(code: 101, message: 'No Internet');
    } on FormatException {
      return Failed(code: 102, message: 'Invalid Format');
    } on SocketException {
      return Failed(code: 102, message: 'No Internet Connection');
    } catch (e) {
      return Failed(code: 103, message: 'Unknown Error');
    }
  }
}
