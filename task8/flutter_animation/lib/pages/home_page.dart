import 'package:flutter/material.dart';
import 'package:flutter_animation/common/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 25.0, end: 30.0).animate(_controller)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: screenHeight * 0.8,
        color: AppColors.skyColor,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 65.0, left: 20.0),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => CircleAvatar(
              backgroundColor: AppColors.sunColor,
              radius: _animation.value,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 20.0),
          child: Image.asset(
            'assets/images/cloud.png',
            height: 50,
            width: 50,
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0),
          child: Image.asset(
            'assets/images/bird.png',
            height: 40,
            width: 40,
            color: Colors.white,
          ),
        ),
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
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Image.asset(
            'assets/images/spinner.png',
            height: 300,
            width: 300,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 45.0, left: 10.0),
          child: Image.asset(
            'assets/images/flower.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 65.0, left: 75.0),
          child: Image.asset(
            'assets/images/flower.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 95.0, left: 10.0),
          child: Image.asset(
            'assets/images/bee.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, right: 100.0),
          child: Image.asset(
            'assets/images/flower.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 120.0),
          child: Image.asset(
            'assets/images/flower.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, right: 40.0),
          child: Image.asset(
            'assets/images/flower.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
    ]));
  }
}
