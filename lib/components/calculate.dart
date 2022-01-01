import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Calculate extends StatelessWidget {
  const Calculate({ Key? key ,required this.name,required this.next}) : super(key: key);
  final String name;
  final VoidCallback next;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: next,
          child: Container(
            height: 70.0,
            width: double.infinity,
            color: kBottomFloatingButton,
            child:  Center(
              child:  Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        );
  }
}