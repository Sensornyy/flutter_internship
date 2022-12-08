import 'dart:math';

import 'package:flutter/material.dart';

Icon getRandomIcon() {
  final List<int> points = <int>[0xe0b0, 0xe0b1, 0xe0b2, 0xe0b3, 0xe0b4];
  final Random r = Random();

  return Icon(IconData(r.nextInt(points.length), fontFamily: 'MaterialIcons'));
}
