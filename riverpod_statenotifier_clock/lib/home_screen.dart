import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_statenotifier_clock/clock.dart';

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this line is used to watch the provider's *state*
    // to get an instance of the clock itself,
    // call `ref.watch(clockProvider.notifier)`
    final currentTime = ref.watch(clockProvider);
    // format the time as `hh:mm:ss`
    final timeFormatted = DateFormat.Hms().format(currentTime);
    return Scaffold(
      body: Center(
        child: Text(
          timeFormatted,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}