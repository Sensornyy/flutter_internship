import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class Sun extends StatefulWidget {
  const Sun({Key? key}) : super(key: key);

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

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
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Padding(
        padding: const EdgeInsets.only(top: 65.0, left: 35.0),
        child: CircleAvatar(
            backgroundColor: AppColors.sunColor, radius: _animation.value),
      ),
    );
  }
}
