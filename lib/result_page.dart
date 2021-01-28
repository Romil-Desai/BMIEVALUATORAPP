import 'package:bmi/customcontainer.dart';
import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';
import 'bottombuttonwidget.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String interpretation;
  final String result;
  final String feedback;
  ResultPage({this.interpretation, this.result, this.feedback});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('YOUR RESULT', style: kTitleTextStyle))),
          Expanded(
              flex: 5,
              child: ContainerLayout(
                colour: kInactivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(result, style: kResultTextStyle),
                    Text(
                      interpretation,
                      style: kFinalResultTextStyle,
                    ),
                    Text(
                      feedback,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          Expanded(
            child: BottomButtonWidget(
                text: 'RECALCULATE',
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                }),
          ),
        ],
      ),
    );
  }
}
