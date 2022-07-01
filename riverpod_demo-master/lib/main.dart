import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/util/color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentSliderValue = StateProvider<double>((ref) => 100);
final colorValue = StateProvider((ref) => 0);

// double _currentSliderValue = 100;

void main() {

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget{
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  int? colorLevel;
  double? _currentSliderValue;


  void loadColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    colorLevel = prefs.getInt('colorSelector') ?? 0;
    _currentSliderValue = prefs.getDouble('sliderValue') ?? 100.0;
    
  }

  @override
  void initState() {
    super.initState();
    // final int colorSelector = ref.read(colorValue);
    // final double sliderValue = ref.read(currentSliderValue);

    loadColor();

    // final double sliderValue = ref.read(currentSliderValue);
    
  }

  @override
  Widget build(BuildContext context) {
    final double sliderValue = ref.watch(currentSliderValue);
    final int colorSelector = ref.watch(colorValue);

    

    return Scaffold(
      appBar: AppBar(
        title: Text('RiverPod Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Icon(
                Icons.cake,
                color: colors[colorSelector],
                size: sliderValue,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ColorPicker(
                index: colorLevel,
                onTap: (selectedColor) async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  colorLevel = selectedColor;
                  ref.read(colorValue.notifier).state = prefs.getInt('colorSelector') ?? 0;
                  prefs.setInt('colorSelector', selectedColor);
                  
                  
                },
                ),
                SizedBox(
                  height: 30,
                ),
            Slider(
              value: _currentSliderValue ?? 100,
              min: 100,
              max: 200,
              divisions: 100,
              label: _currentSliderValue?.round().toString(),
              onChanged: (double value) async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                _currentSliderValue = prefs.getDouble('sliderValue') ?? 100;
                ref.read(currentSliderValue.notifier).state = value;
                prefs.setDouble('sliderValue', value);
                
              },
            ),
          ],
        ),
      ),
    );
  }
}

// setColor() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.setInt('colorValue', colorLevel);
// }

// getColor() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   int value = preferences.getInt('colorValue') ?? 0;
//   return value;
// }