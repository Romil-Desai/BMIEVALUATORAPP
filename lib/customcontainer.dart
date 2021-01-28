import 'package:flutter/material.dart';

class ContainerLayout extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  Function ontap;
  ContainerLayout({@required this.colour, this.cardChild, this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
