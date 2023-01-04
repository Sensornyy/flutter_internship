import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/task_cubit.dart';
import 'pages/home_page.dart';

void main() => runApp(
      BlocProvider<TasksCubit>(
        create: (context) => TasksCubit()..start(),
        child: MaterialApp(
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
      ),
    );
