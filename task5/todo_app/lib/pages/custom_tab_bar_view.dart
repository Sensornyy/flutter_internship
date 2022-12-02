import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key, required this.pages}) : super(key: key);

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [...pages]);
  }
}
