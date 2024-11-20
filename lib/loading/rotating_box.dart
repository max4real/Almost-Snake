import 'dart:math';

import 'package:flutter/material.dart';

class RotatingBox extends StatefulWidget {
  const RotatingBox({super.key});

  @override
  State<RotatingBox> createState() => _RotatingBoxState();
}

class _RotatingBoxState extends State<RotatingBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ).drive(
      Tween<double>(begin: 0, end: pi),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _animation.value,
              child: Container(
                width: 15,
                height: 15,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
