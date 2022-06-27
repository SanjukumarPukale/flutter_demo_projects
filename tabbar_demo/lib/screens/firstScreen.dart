import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:tabbar_demo/screens/loginPage.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login page'),),

      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
        }, child: Text('Press here'),),
      ),
    );
    
  }
}