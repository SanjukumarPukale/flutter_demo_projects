import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));      // 1
}

final myProvider = Provider((ref) => 0);             // 2

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final int number = 22;  
  
  @override
  Widget build(BuildContext context) {
    print('widget rebuild');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Consumer(builder: (context, ref, child) {
            int myValue = ref.watch(myProvider);
            return Text('some number ${myValue}');
          },)
        ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              
            },
            icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

