import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription({Key? key, required this.level}) : super(key: key);

  final String level;

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
        Text(level,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

extension LevelDescriptionSwitchCaseMethods on LevelDescription {
  double switchCaseForWidthFactor() {
    switch (level) {
      case 'Beginner':
        return 0.3;
      case 'Intermediate':
        return 0.5;
      case 'Advanced':
        return 1;
      default:
        return 0;
    }
  }
}
