import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButtonWidget extends StatelessWidget {
  String text;
  Function onpressed;
  BottomButtonWidget({this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpressed();
      },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kBottomButtonText,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        color: kBottomcontainerbackgroundcolor,
      ),
    );
  }
}
