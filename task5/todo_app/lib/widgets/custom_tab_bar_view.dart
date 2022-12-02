import 'package:flutter/material.dart';

import '../pages/lessons_page.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key}) : super(key: key);

  static const List<Widget> _pages = <Widget>[
    LessonsPage(),
    Icon(Icons.calendar_month_outlined, size: 150),
    Icon(Icons.sticky_note_2_outlined, size: 150),
    Icon(Icons.person_outline, size: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [..._pages]);
  }
}
