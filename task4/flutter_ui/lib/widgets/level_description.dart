import 'package:flutter/material.dart';
import 'package:flutter_ui/common/app_colors.dart';
import 'package:flutter_ui/model/level.dart';

import '../model/level.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription({Key? key, required this.level}) : super(key: key);

  final Level level;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: 10,
              width: 50,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: AppColors.cardBackground,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: switchCaseForWidthFactor(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Text(switchCaseForTextTitle(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  double switchCaseLevel(Level level) {
    switch (level) {
      case Level.beginner:
        return 0.3;
      case Level.intermediate:
        return 0.5;
      default:
        return 1;
    }
  }
}

extension LevelDescriptionSwitchCaseMethods on LevelDescription {
  double switchCaseForWidthFactor() {
    switch (level) {
      case Level.beginner:
        return 0.3;
      case Level.intermediate:
        return 0.5;
      case Level.advanced:
        return 1;
      default:
        return 0;
    }
  }

  String switchCaseForTextTitle() {
    switch (level) {
      case Level.beginner:
        return 'Beginner';
      case Level.intermediate:
        return 'Intermediate';
      case Level.advanced:
        return 'Advanced';
      default:
        return 'Undefined';
    }
  }
}
