// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_2/models/articleModel.dart';
import 'package:flutter_application_2/screens/deatailOfArticle.dart';

class ListOfArticle extends StatelessWidget {
  final List<ArticleModel> list;

  const ListOfArticle({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailOfArticle(selectedArticle: list[index]),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: list.length,
      ),

      appBar: AppBar(
        title: Text('List Page'),
      ),
    );
  }
}
