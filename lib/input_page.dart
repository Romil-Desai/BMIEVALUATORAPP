import 'package:bmi/CalculatorBrain.dart';
import 'package:bmi/result_page.dart';
import 'package:bmi/roundiconbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottombuttonwidget.dart';
import 'containercontent.dart';
import 'customcontainer.dart';
import 'constants.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    child: ContainerLayout(
                  colour: selectedGender == gender.male
                      ? kActivecardcolor
                      : kInactivecardcolor,
                  ontap: () {
                    setState(() {
                      selectedGender = gender.male;
                    });
                  },
                  cardChild: ContainerContent(
                      custom_icon: FontAwesomeIcons.mars, text: 'MALE'),
                )),
                Expanded(
                    child: ContainerLayout(
                  colour: selectedGender == gender.female
                      ? kActivecardcolor
                      : kInactivecardcolor,
                  ontap: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                  cardChild: ContainerContent(
                      custom_icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                )),
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: ContainerLayout(
                colour: kInactivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kTextLabelStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(), style: kTextDataStyle),
                        Text(
                          'cm',
                          style: kTextLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    child: ContainerLayout(
                  colour: kInactivecardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kTextDataStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon_data: FontAwesomeIcons.minus,
                            oncalled: () {
                              setState(() {
                                weight -= 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon_data: FontAwesomeIcons.plus,
                            oncalled: () {
                              setState(() {
                                weight += 1;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ContainerLayout(
                  colour: kInactivecardcolor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kTextDataStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon_data: FontAwesomeIcons.minus,
                            oncalled: () {
                              setState(() {
                                age -= 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon_data: FontAwesomeIcons.plus,
                            oncalled: () {
                              setState(() {
                                age += 1;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomButtonWidget(
                text: 'CALCULATE',
                onpressed: () {
                  CalculatorBrain brain =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                interpretation: brain.calculateBmi(),
                                result: brain.getResult(),
                                feedback: brain.getfeedback(),
                              )));
                }),
          )
        ],
      ),
    );
  }
}
