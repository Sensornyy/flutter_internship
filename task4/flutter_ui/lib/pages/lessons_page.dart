import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/widgets/lesson_card.dart';

import '../model/level.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LessonCard(
              icon: SvgPicture.asset(
                'assets/images/car-sideview.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              text: const Text(
                'Introduction to Driving',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              level: Level.beginner),
          LessonCard(
              icon: SvgPicture.asset(
                'assets/images/steering-wheel-2.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              text: const Text(
                'Observations at Junctions',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              level: Level.beginner),
          LessonCard(
              icon: SvgPicture.asset(
                'assets/images/parking-box-fill.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              text: const Text(
                'Reverse Parallel Parking',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              level: Level.intermediate),
          LessonCard(
              icon: SvgPicture.asset(
                'assets/images/car-rental-outline.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              text: const Text(
                'Reversing Around Corner',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              level: Level.intermediate),
          LessonCard(
              icon: SvgPicture.asset(
                'assets/images/car-wheel.svg',
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              text: const Text(
                'Incorrect Use of Signals',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              level: Level.advanced),
        ],
      ),
    );
  }
}
