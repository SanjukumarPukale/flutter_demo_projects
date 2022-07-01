import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_demo/counter_model.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, value, child) {
            return Text(
              '${value.getCount}',
              style: TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
