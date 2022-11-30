import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'lessons_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Widget> _pages = <Widget>[
    LessonsPage(),
    Icon(Icons.calendar_month_outlined, size: 150),
    Icon(Icons.sticky_note_2_outlined, size: 150),
    Icon(Icons.person_outline, size: 150),
  ];

  static const List<Tab> _tabs = <Tab>[
    Tab(child: Icon(Icons.book_outlined, size: 40)),
    Tab(child: Icon(Icons.calendar_month_outlined, size: 40)),
    Tab(child: Icon(Icons.sticky_note_2_outlined, size: 40)),
    Tab(child: Icon(Icons.person_outlined, size: 40)),
  ];

  late final TabController _controller;

  var _index = 0;

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          labelPadding: EdgeInsets.all(20),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.mainBackground,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              actions: const <Widget>[Icon(Icons.notes_sharp)],
              title: const Text('Lessons', style: TextStyle(color: Colors.white))),
          body: Center(child: _pages[_index]),
          bottomNavigationBar: ColoredBox(
            color: AppColors.tabBarColor,
            child: TabBar(
              controller: _controller,
              onTap: _onTapped,
              indicatorColor: Colors.amber,
              indicatorWeight: 4,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.amber,
              tabs: const <Tab>[..._tabs],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
