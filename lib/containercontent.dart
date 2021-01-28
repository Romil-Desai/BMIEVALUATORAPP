import 'package:flutter/material.dart';
import 'constants.dart';

class ContainerContent extends StatelessWidget {
  ContainerContent({this.custom_icon, this.text});
  final IconData custom_icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          custom_icon,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(text, style: kTextLabelStyle)
      ],
    );
  }
}
