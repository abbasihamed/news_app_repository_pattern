import 'package:news_repo_pattern/src/data/model/news_model.dart';
import 'package:news_repo_pattern/src/data/remote/data_state.dart';
import 'package:news_repo_pattern/src/data/remote/mapper.dart';
import 'package:news_repo_pattern/src/data/remote/news_service.dart';
import 'package:news_repo_pattern/src/domain/entities/error.dart';

class NewsRepository {
  late final NewsService _newsService;
  late final Mapper _mapper;

  Future getNews() async {
    _newsService = NewsService();
    _mapper = Mapper();
    final response = await _newsService.getNews();
    if (response is Success) {
      final data = _mapper.toNews(response.message as NewsModel);
      return data;
    }
    if (response is Failed) {
      return Error(message: response.message ?? 'null');
    }
  }
}
