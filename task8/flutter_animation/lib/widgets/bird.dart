import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  const Bird({Key? key}) : super(key: key);

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween<Offset>(
                  begin: const Offset(0.0, 0.0), end: const Offset(5.0, -7.0))
              .chain(CurveTween(curve: Curves.easeInOut)) ,
          weight: 1.0),
      TweenSequenceItem(
          tween: Tween<Offset>(
                  begin: const Offset(5.0, -7.0), end: const Offset(11.0, 0.0))
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1.0),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        'assets/images/bird.png',
        height: 40,
        width: 40,
        color: Colors.white,
      ),
    );
  }
}
