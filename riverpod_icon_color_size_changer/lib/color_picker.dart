import 'package:flutter/material.dart';

List<Color> colors = const [
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  Colors.black,
  Colors.brown,
  Colors.greenAccent
];

class ColorPicker extends StatefulWidget {
  int? index;
  final Function(int) onTap;
  ColorPicker({Key? key, required this.index, required this.onTap }) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () {
              widget.index = index;
              widget.onTap(index);
              setState(() {
                
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: colors[index],
                    
                  ),
                ),
                widget.index == index ? const Icon(Icons.check) : Container(),
              ],
            ),
          );
        }
        ),
    );
  }
}