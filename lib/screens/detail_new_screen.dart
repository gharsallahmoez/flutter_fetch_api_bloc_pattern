import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/bloc/news_bloc.dart';

class DetailNewScreen extends StatelessWidget {
  static const routeName = '/detailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is ArticleDetail) {
            return Text(state.article.title);
          }
          return Container();
        },
      ),
    );
  }
}
