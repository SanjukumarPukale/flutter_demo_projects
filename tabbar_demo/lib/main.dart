import 'package:flutter/material.dart';
import 'package:tabbar_demo/screens/firstScreen.dart';
import 'package:tabbar_demo/screens/secondScreen.dart';
import 'package:tabbar_demo/screens/thirdScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TabbarView'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'First',
                ),
                Tab(
                  text: 'Second',
                ),
                Tab(
                  text: 'Third',
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            FirstScreen(),
            SecondScreen(),
            ThirdScreen()
          ]),
        ),
      ),
    );
  }
}
