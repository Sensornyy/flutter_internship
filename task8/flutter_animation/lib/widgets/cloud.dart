import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  const Cloud({Key? key}) : super(key: key);

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    _animation = Tween<double>(begin: 5, end: 500).animate(_controller);
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
        padding: EdgeInsets.only(top: 65.0, left: _animation.value),
        child: Image.asset(
          'assets/images/cloud.png',
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
