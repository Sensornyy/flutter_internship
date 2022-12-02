import 'package:flutter/material.dart';

import '../widgets/custom_tab_bar.dart';
import '../widgets/custom_tab_bar_view.dart';
import '../common/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            actions: const <Widget>[Icon(Icons.notes_sharp)],
            title:
                const Text('Lessons', style: TextStyle(color: Colors.white))),
        body: const Center(
          child: CustomTabBarView(),
        ),
        bottomNavigationBar: const ColoredBox(
            color: AppColors.tabBarColor, child: CustomTabBar()),
      ),
    );
  }
}
