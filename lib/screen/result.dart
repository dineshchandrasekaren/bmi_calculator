import 'package:bmi_calculator/components/calculate.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String interpretation;

  final String bmiResult;

  final String resultText;

 const Result(
      {required this.interpretation,
        required this.bmiResult,
        required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: kReusableBigTitle('Your Result'),
          ),
          Expanded(
            child: ReusableButton(
              colour: kActiveColor,
              cardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                     Text(
                      resultText,
                      style:
                         const TextStyle(color: Color(0xFF24D876), fontSize: 25.0),
                    ),
                    kReusableBigTitle(bmiResult),
                    kSmallReusableTitle(
                        interpretation),
                  ],
                ),
              ),
            ),
          ),
          Calculate(name: 'RE-CALCULATE', next: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
