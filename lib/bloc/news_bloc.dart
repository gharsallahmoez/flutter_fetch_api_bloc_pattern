import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/model/News.dart';
import 'package:flutter_fetch_api_bloc_pattern/repository/repository.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  ArticleRepository repository;

  NewsBloc({this.repository}) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetArticles) {
      try {
        yield NewsLoading();
        List<Articles> news = await repository.fetchResults();
        yield NewsLoaded(news);
      } catch (e) {
        yield NewsError(e.toString());
      }
    }
    if (event is GetArticleDetail) {
      List<Articles> articles = state.news;
      Articles a = articles.elementAt(event.index);
      yield ArticleDetail(a);
    }
  }
}
