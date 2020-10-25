import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/bloc/news_bloc.dart';
import 'package:flutter_fetch_api_bloc_pattern/model/News.dart';
import 'package:flutter_fetch_api_bloc_pattern/screens/detail_new_screen.dart';

// statefull because we need to use initState to load news when app start
class ListNewsScreen extends StatefulWidget {
  @override
  _ListNewsScreenState createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  List<Articles> news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of news'),
      ),
      body: Container(
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(state.news[index].title),
                    onTap: () {
                      BlocProvider.of<NewsBloc>(context).add(GetArticleDetail(index));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailNewScreen()),
                      );
                    });
              },
            );
          }
          return Text('');
        }),
      ),
    );
  }
}
