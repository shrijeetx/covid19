import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final EdgeInsetsGeometry edge;
  final Widget cardChild;
  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: edge,
      width: width,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: cardChild,
    );
  }

  ReusableCard({this.cardChild, @required this.color,this.edge,this.height,this.width});
}
