import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_demo/counter_app.dart';
import 'package:provider_counter_demo/counter_model.dart';

// How to use Provider: steps given below.

// 1) create class CounterModel extends ChangeNotifier, and inside this apply counter logic not forgot to write notifyListeners() at the end
// 2) Now to use this CounterModel provider, we have to wrap whole MaterialWidget within ChangeNotifierProvider
// 3) now we are able to use this ChangeNotifier in entire widget, now where we want to display the changing value there we have to wrap that widget within Consumer 
// 4) to change counter value we can use this syntx to access the increment() which is inside CounterModel
    //  Provider.of<CounterModel>(context, listen: false).incrementCounter();  // in this movement we dont need listen value of the count so we can listen: false

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 2
    return ChangeNotifierProvider<CounterModel>(create: (context) => CounterModel(),
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.blue,
      ),
      home: CounterApp(),
    ),
    );
  }
}

