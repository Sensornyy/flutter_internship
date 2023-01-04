import 'package:flutter/material.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView(this.page, {Key? key, required this.pages}) : super(key: key);

  final Widget page;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [page, ...pages]);
  }
}
