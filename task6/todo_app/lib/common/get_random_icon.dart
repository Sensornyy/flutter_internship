import 'dart:math';

import 'package:flutter/material.dart';

Icon getRandomIcon() {
  final List<IconData> icons = <IconData>[Icons.school, Icons.work, Icons.home, Icons.car_rental];
  final Random r = Random();

  return Icon(icons[r.nextInt(icons.length)], color: Colors.white, size: 44,);
}
