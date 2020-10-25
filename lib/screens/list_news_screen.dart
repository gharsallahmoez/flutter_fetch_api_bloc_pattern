import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_bloc_pattern/screens/detail_new_screen.dart';

// statefull because we need to use initState to load news when app start
class ListNewsScreen extends StatefulWidget {
  @override
  _ListNewsScreenState createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of news'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('hello'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailNewScreen()),
              ),
            );
          },
        ),
      ),
    );
  }
}
