import 'package:flutter/cupertino.dart';
const kPrimaryColor =  Color(0xFF0a0c21);
const kLightGrayColor = Color(0xFF4C4F5E);
const kInActiveSliderColor = Color(0xFF8D8E98);
const kSmallTextStyle = TextStyle(fontSize: 18.0, color: kInActiveSliderColor);
const kBigTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kActiveColor = Color(0xFF1D1E33);
const kInActiveColor = Color(0xFF111328);
const kActiveSliderColor = Color(0xFFEB1555);
const kBottomFloatingButton = Color(0xFFeb1555);
Text kSmallReusableTitle(String title) {
  return Text(
    title,
    style: kSmallTextStyle,
  );
}

Text kReusableBigTitle(String title) {
  return Text(
    title,
    style: kBigTextStyle,
  );
}
