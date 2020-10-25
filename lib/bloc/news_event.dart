part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetArticles extends NewsEvent {
  // already has default empty constructor
}

class GetArticleDetail extends NewsEvent {
  int index;

  GetArticleDetail(this.index);
}
