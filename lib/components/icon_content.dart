import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, this.icon, this.name}) : super(key: key);
  final IconData? icon;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 90.0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        kSmallReusableTitle('$name')
      ],
    );
  }
}
