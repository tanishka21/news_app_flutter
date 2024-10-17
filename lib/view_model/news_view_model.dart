import 'package:news_application/models/categories_news_model.dart';
import 'package:news_application/models/news_chanels_headlines_model.dart';
import 'package:news_application/repository/new_repository.dart';

class NewsViewModel {
  final _repo = NewsRepo();

  Future<NewsChannelsHeadlinesModel?> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    final response = await _repo.fetchNewsChannelHeadlineApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel?> fetchCategoriesNewsApi(String category) async {
    final response = await _repo.fetchCategoriesNewsApi(category);
    return response;
  }
}
