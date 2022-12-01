import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/common/app_colors.dart';
import 'package:flutter_ui/common/slide_transition.dart';
import 'package:flutter_ui/pages/info_page.dart';
import 'package:flutter_ui/widgets/level_description.dart';

import '../model/lesson/lesson.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({Key? key, required this.lesson}) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, slideTransitionTo(page: const InfoPage()));
      },
      child: Stack(
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
                  SvgPicture.asset(lesson.iconName,
                      color: Colors.white, height: 40, width: 40),
                  const SizedBox(width: 10),
                  const VerticalDivider(
                      color: Colors.grey, indent: 12, endIndent: 12),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(lesson.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300)),
                      const SizedBox(height: 5),
                      LevelDescription(level: lesson.level),
                    ],
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(
              left: 345,
              top: 40,
            ),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
