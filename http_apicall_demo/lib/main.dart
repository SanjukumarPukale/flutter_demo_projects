import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_apicall_demo/student_model.dart';

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
      home: HttpScreen(),
    );
  }
}

class HttpScreen extends StatelessWidget {
  const HttpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<StudentModel>(
          future: getStudent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final student = snapshot.data;

              return Text('name : ${student?.name} \n skill : ${student?.skill} \n educatiln : ${student?.education}');
            } else if (snapshot.hasError) {}
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<StudentModel> getStudent() async {
  final url = Uri.parse('https://api.jsonbin.io/b/5e1219328d761771cc8b9394');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonStudent = jsonDecode(response.body);
    return StudentModel.fromJson(jsonStudent);
  } else {
    throw Exception();
  }
}
