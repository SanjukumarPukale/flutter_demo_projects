import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/article_model.dart';
import 'package:flutter_application_1/screens/listOfArticle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);

  List<ArticleModel> article = [
    ArticleModel('Item1',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk'),
    ArticleModel('Item2',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk'),
    ArticleModel('Item3',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk'),
    ArticleModel('Item4',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk'),
    ArticleModel('Item5',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk'),
    ArticleModel('Item6',
        'ajsdfjsklfljslkdfkljsdlkflsdlkfjdklflklkjklljkjlajdflkjklsdflklkasjadsfjajfkjdfjk')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('App demo'),
        ),
      ),
    );
  }
}
