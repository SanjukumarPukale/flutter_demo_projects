import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// source code: https://codewithandrea.com/articles/flutter-state-management-riverpod/



void main() {
  runApp(
    ProviderScope(child: const MyApp()),  // 1) We have to wrap MyApp() within ProviderScope()
  );
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
      home: const MyHomePage(),
    );
  }
}

// 2) create counterStateProvider
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});


// 3) make stateless widget as ConsumerWidget
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

// 4) make build(BuildContext context, WidgetRef ref)
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<StateController<int>>(counterStateProvider.state, (previous, current) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Value is ${current.state}'),),
    );
  });


    // 5) It will assign value as counterStateProvider state changes
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      body: Center(
        child: Text(
          // 2. use the counter value
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(

        // 6) It will read the counterStateprovider and make changes 
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
