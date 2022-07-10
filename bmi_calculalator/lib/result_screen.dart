// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:bmi_calculalator/bmi_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({
    Key? key,
    required this.bmiModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                      'assets/images/happy.svg',
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      'assets/images/sad.svg',
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Your BMI is ${bmiModel.bmi.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.red[700]),
            ),
            Text(
              '${bmiModel.comments}',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[700]),
            ),
            
            SizedBox(
              height: 16,
            ),

            bmiModel.isNormal
                ? Text(
                    'Hurray! your BMI is normal',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.green[700]),
                  )
                : Text(
                    'Sadly! your BMI is not normal',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.red[700]),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  }
                  ,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  label: Text('Let Calculate again'),
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
    );
  }
}
