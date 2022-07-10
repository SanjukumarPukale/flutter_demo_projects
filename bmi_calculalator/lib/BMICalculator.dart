import 'package:bmi_calculalator/bmi_model.dart';
import 'package:bmi_calculalator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class BMICalculatorScreen extends StatefulWidget {
  BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 100;
  double _weightOfUser = 40;
  double _bmi = 0;

  BMIModel? _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  'assets/images/heart.svg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.red[700]),
              ),
              Text(
                'We care about your health',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Height (cm)',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  value: _heightOfUser,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  min: 80,
                  max: 250,
                  divisions: 100,
                  activeColor: Colors.red,
                  label: '$_heightOfUser',
                ),
              ),
              Text(
                '$_heightOfUser cm',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.red),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Weight (kg)',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  value: _weightOfUser,
                  onChanged: (weight) {
                    setState(() {
                      _weightOfUser = weight;
                    });
                  },
                  min: 30,
                  max: 120,
                  divisions: 100,
                  activeColor: Colors.red,
                  label: '$_weightOfUser',
                ),
              ),
              Text(
                '$_weightOfUser kg',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.red),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser /
                        ((_heightOfUser / 100) * (_heightOfUser / 100));

                    if (_bmi >= 18.5 && _bmi <= 25) {
                      _bmiModel = BMIModel(
                          bmi: _bmi,
                          isNormal: true,
                          comments: 'You are totally fit');
                    } else if (_bmi < 18.5) {
                      _bmiModel = BMIModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: 'You are under weighted');
                    } else if (_bmi >= 25 && _bmi <= 30) {
                      _bmiModel = BMIModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: 'You are over weighted');
                    } else {
                      _bmiModel = BMIModel(
                          bmi: _bmi,
                          isNormal: false,
                          comments: 'You are obesed');
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(bmiModel: _bmiModel),
                      ),
                    );
                    });
                  }
                  ,
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text('Calculate'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
