import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/models/categories_news_model.dart';
import 'package:news_application/models/news_chanels_headlines_model.dart';

class NewsRepo {
  Future<NewsChannelsHeadlinesModel?> fetchNewsChannelHeadlineApi(
      String channelName) async {
    try {
      String url =
          'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=715ee83c919d47348bf41e6d250f0428';
      print('$url');
      final response = await http.get(Uri.parse(url));

      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        print('$body');
        return NewsChannelsHeadlinesModel.fromJson(body);
      }
    } catch (e) {
      print('$e');
      throw Exception('Error');
    }
    return null;
  }

  Future<CategoriesNewsModel?> fetchCategoriesNewsApi(String category) async {
    try {
      String url =
          'https://newsapi.org/v2/everything?q=$category&apiKey=715ee83c919d47348bf41e6d250f0428';
      print('$url');
      final res = await http.get(Uri.parse(url));

      if (kDebugMode) {
        print(res.body);
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        print('$body');
        return CategoriesNewsModel.fromJson(body);
      }
    } catch (e) {
      print('$e');
      throw Exception('Error');
    }
    return null;
  }
}
