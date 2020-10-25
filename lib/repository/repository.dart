import 'dart:convert';
import 'package:flutter_fetch_api_bloc_pattern/model/News.dart';
import 'package:http/http.dart' as http;

abstract class ArticleRepository {
  Future<List<Articles>> fetchResults() {}
}

class ArticleRepositoryImp implements ArticleRepository {
  @override
  Future<List<Articles>> fetchResults() async {
    ApiResultModel result;
    const url = 'http://newsapi.org/v2/top-headlines?sources=espn-cric-info&apikey=f467a2f0aa2f454fad1f8f256dcac723';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var output = json.decode(response.body);
      result = ApiResultModel.fromJson(output);
      return result.articles;
    }
    throw Exception();
  }
}
