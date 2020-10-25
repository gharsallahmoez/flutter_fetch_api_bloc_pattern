import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/bloc/news_bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/repository/repository.dart';
import 'package:flutter_fetch_api_bloc_pattern/screens/list_news_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(repository: ArticleRepositoryImp()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ListNewsScreen(),
      ),
    );
  }
}
