import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_berita/models/article_model.dart';

class ApiService {
  final endpointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'country': 'id',
      'categroy': 'sports',
      'apikey': '8f19d069cd724a96a2e83f3b55df1c00',
    };

    final uri = Uri.https(endpointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
