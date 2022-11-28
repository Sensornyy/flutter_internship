import 'package:flutter/material.dart';
import 'package:flutter_ui/common/app_colors.dart';
import 'package:flutter_ui/widgets/level_description.dart';
import 'package:flutter_ui/common/slide_transition.dart';

import '../pages/info_page.dart';
import '../model/level.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
    required this.text,
    required this.icon,
    required this.level,
  }) : super(key: key);

  final Text text;
  final Widget icon;
  final Level level;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            width: 380,
            height: 100,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.cardBackground),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 20),
                icon,
                const SizedBox(width: 10),
                const VerticalDivider(
                    color: Colors.grey, indent: 12, endIndent: 12),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text,
                    const SizedBox(height: 5),
                    LevelDescription(level: level),
                  ],
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(
            left: 345,
            top: 40,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, slideTransitionTo(page: const InfoPage()));
            },
            child: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
