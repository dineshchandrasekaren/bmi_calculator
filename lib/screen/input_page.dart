import 'package:bmi_calculator/calculate_brain.dart';
import 'package:bmi_calculator/components/calculate.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screen/result.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }
int height = 140;
int weight = 40;
int age = 22;
CalculateBrain calc =CalculateBrain( height, weight);
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? genderSelected;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableButton(
                  onPress: () => {setState(() => genderSelected = Gender.male)},
                  colour: genderSelected == Gender.male
                      ? kActiveColor
                      : kInActiveColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars,
                    name: "MALE",
                  ),
                ),
              ),
              Expanded(
                child: ReusableButton(
                  onPress: () =>
                      {setState(() => genderSelected = Gender.female)},
                  colour: genderSelected == Gender.female
                      ? kActiveColor
                      : kInActiveColor,
                  cardChild: const IconContent(
                    icon: FontAwesomeIcons.venus,
                    name: "FEMALE",
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusableButton(
            colour: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                kSmallReusableTitle("HEIGHT"),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    kReusableBigTitle('$height'),
                    const Text(
                      'cm',
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: kActiveSliderColor,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 27.0),
                        overlayColor: const Color(0x30EB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 200,
                      inactiveColor: kInActiveSliderColor,
                      onChanged: (double newValue) {
                        setState(() => {
                              height = newValue.round(),
                            });
                      },
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableButton(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      kSmallReusableTitle('WEIGHT'),
                      kReusableBigTitle('$weight'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            action: () => setState(() => {weight--}),
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            action: () => setState(() => {weight++}),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableButton(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      kSmallReusableTitle('AGE'),
                      kReusableBigTitle('$age'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedIconButton(
                            icon: FontAwesomeIcons.minus,
                            action: () => setState(() => {age--}),
                          ),
                          RoundedIconButton(
                            icon: FontAwesomeIcons.plus,
                            action: () => setState(() => {age++}),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Calculate(
          name: 'Calculate',
          next: () =>{

            Navigator.push( context,MaterialPageRoute(builder: (context) =>  Result(bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation()),
            ),
          ),
          },
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key, this.icon, this.action}) : super(key: key);
  final IconData? icon;
  final VoidCallback? action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      shape: const CircleBorder(),
      fillColor: kLightGrayColor,
      padding: const EdgeInsets.all(20.0),
      elevation: 6.0,
      highlightElevation: 10.0,
      child: Icon(icon),
    );
  }
}
