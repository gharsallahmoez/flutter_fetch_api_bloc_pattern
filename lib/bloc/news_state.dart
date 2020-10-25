part of 'news_bloc.dart';

@immutable
abstract class NewsState {
  List<Articles> news;
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  List<Articles> news;
  NewsLoaded(this.news);
}

class NewsError extends NewsState {
  String message;

  NewsError(this.message);
}

class ArticleDetail extends NewsState {
  Articles article;

  ArticleDetail(this.article);
}
