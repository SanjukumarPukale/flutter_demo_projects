import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_demo/homeScreen.dart';
import 'package:shared_preferences_demo/welcomeScreen.dart';

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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool visitingFlag = await gevisitingFlag();

            setvisitingFlag();

            if(visitingFlag == true){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),),);
            }
        }, 
          child: Text('Proceed', style: TextStyle(color: Colors.white),),
          
          ),
      ),
    );
  }
}

setvisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('alreadyVisited', true);
}

gevisitingFlag() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyVisited = preferences.getBool('alreadyVisited') ?? false;
  return alreadyVisited;
}

