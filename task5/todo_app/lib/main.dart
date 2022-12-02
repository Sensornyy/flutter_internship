import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          tabBarTheme: const TabBarTheme(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            labelPadding: EdgeInsets.all(20),
          ),
        ),
        home: const HomePage(),
      ),
    );
