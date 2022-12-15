import 'package:flutter/material.dart';
import 'package:flutter_animation/common/app_colors.dart';
import 'package:flutter_animation/widgets/bird.dart';

import '../widgets/bee.dart';
import '../widgets/cloud.dart';
import '../widgets/flower.dart';
import '../widgets/spinner.dart';
import '../widgets/sun.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: screenHeight * 0.8,
            color: AppColors.skyColor,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Sun(),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Cloud(),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Bird(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.2,
              color: AppColors.groundColor,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: Container(
                  height: screenHeight * 0.6,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.treeColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )),
          const Align(
            alignment: Alignment.center,
            child: Spinner(),
          ),
          const Flower(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 45.0, left: 10.0),
          ),
          const Flower(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 65.0, left: 75.0),
          ),
          const Flower(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 15.0, right: 100.0),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 105.0, left: 30.0),
              child: Bee(),
            ),
          ),
          const Flower(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 15.0, left: 120.0),
          ),
          const Flower(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 50.0, right: 40.0),
          ),
        ],
      ),
    );
  }
}
