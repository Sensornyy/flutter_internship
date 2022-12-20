import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  static const List<Tab> _tabs = <Tab>[
    Tab(child: Icon(Icons.book_outlined, size: 40)),
    Tab(child: Icon(Icons.calendar_month_outlined, size: 40)),
    Tab(child: Icon(Icons.sticky_note_2_outlined, size: 40)),
    Tab(child: Icon(Icons.person_outlined, size: 40)),
  ];

  @override
  Widget build(BuildContext context) {
    return const TabBar(
        indicatorColor: Colors.amber,
        indicatorWeight: 4,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.amber,
        tabs: <Tab>[..._tabs]);
  }
}
