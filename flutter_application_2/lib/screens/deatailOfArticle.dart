// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_2/models/articleModel.dart';

class DetailOfArticle extends StatelessWidget {
  final ArticleModel selectedArticle;

  const DetailOfArticle({
    Key? key,
    required this.selectedArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(selectedArticle.title),
          Divider(),
          Text(selectedArticle.detail),
        ],
      ),
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
    );
  }
}
