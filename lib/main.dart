import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screen/input_page.dart';
import 'package:bmi_calculator/screen/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalc());
}

class BMICalc extends StatelessWidget {
  const BMICalc({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: kPrimaryColor),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "BMI CALCULATOR",
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
        ),
        body: const SafeArea(child: InputPage()),
      ),
    );
  }
}
