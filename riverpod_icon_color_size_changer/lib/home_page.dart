import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_icon_color_size_changer/color_picker.dart';
import 'package:riverpod_icon_color_size_changer/model.dart';


final sizeStateProvider = StateProvider<double>((ref) => 100);
final colorStateProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     double currentSliderValue = ref.watch(sizeStateProvider);
     int colorLevel = ref.watch(colorStateProvider);
     print('rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Icon(
                Icons.cake,
                color: colors[colorLevel],
                size: currentSliderValue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ColorPicker(
                index: colorLevel,
                onTap: (selectedColor){
                  ref.read(colorStateProvider.notifier).state = selectedColor;

                },
                ),
                const SizedBox(
                  height: 30,
                ),
            Slider(
              value: currentSliderValue,
              min: 100,
              max: 200,
              divisions: 100,
              label: currentSliderValue.round().toString(),
              onChanged: (double value) {
                ref.read(sizeStateProvider.notifier).state = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

