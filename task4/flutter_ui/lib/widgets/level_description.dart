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
                    widthFactor: level == Level.beginner
                        ? 0.3
                        : level == Level.intermediate
                            ? 0.5
                            : 1,
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
        Text(
          level == Level.beginner
              ? 'Beginner'
              : level == Level.intermediate
                  ? 'Intermediate'
                  : 'Advanced',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}
