import 'package:flutter/material.dart';

class Flower extends StatelessWidget {
  const Flower(
      {required this.alignment,
      required this.padding,
      Key? key})
      : super(key: key);

  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: Image.asset(
          'assets/images/flower.png',
          height: 40,
          width: 40
        ),
      ),
    );
  }
}
