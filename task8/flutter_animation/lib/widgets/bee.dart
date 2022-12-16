import 'package:flutter/material.dart';

class Bee extends StatefulWidget {
  const Bee({Key? key}) : super(key: key);

  @override
  State<Bee> createState() => _BeeState();
}

class _BeeState extends State<Bee> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease)
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
      builder: (context, child) => Transform.translate(
        offset: Offset(100 * _animation.value, 100 * _animation.value),
        child: Image.asset(
          'assets/images/bee.png',
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
