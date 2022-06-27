import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/article_model.dart';


class ListOfArticles extends StatelessWidget {
  List<ArticleModel>? _list;

  ListOfArticles(this._list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_list![index].title),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ,),);
            },
          );
        },
        itemCount: _list?.length,
      ),
    );
  }
}
