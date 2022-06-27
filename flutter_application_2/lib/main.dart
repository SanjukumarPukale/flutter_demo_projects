import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/articleModel.dart';
import 'package:flutter_application_2/screens/listOfArticles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<ArticleModel> article = [
    ArticleModel(title: 'Title1', detail: 'Hi, I am Sanjukumar Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here'),
    ArticleModel(title: 'Title2', detail: 'Hi, I am Manjunath Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here'),
    ArticleModel(title: 'Title3', detail: 'Hi, I am Sangeeta Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here'),
    ArticleModel(title: 'Title4', detail: 'Hi, I am Yahshraj Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here'),
    ArticleModel(title: 'Title5', detail: 'Hi, I am Ramesh Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here'),
    ArticleModel(title: 'Title6', detail: 'Hi, I am Kanchan Pukale from Jamkhandi. This is my companny to work, please give me permission to take any time to come here')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListOfArticle(list: article),
    );
  }
}

