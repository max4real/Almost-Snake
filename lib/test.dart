import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Direction { tl, tr, bl, br }

class DVDPageOptimize extends StatefulWidget {
  const DVDPageOptimize({super.key});

  @override
  State<DVDPageOptimize> createState() => _DVDPageOptimizeState();
}

class _DVDPageOptimizeState extends State<DVDPageOptimize> {
  late final Timer _timer;
  final ValueNotifier<Offset> _offsetNotifier =
      ValueNotifier(Offset(Get.width / 3, Get.height / 2));
  final ValueNotifier<Direction> _currentDirNotifier =
      ValueNotifier(Direction.tr);

  final double _boxSize = 50;
  final double _animationSpeed = 5;
  late final double _maxWidth, _maxHeight;

  @override
  void initState() {
    super.initState();
    _maxWidth = Get.width - _boxSize;
    _maxHeight = Get.height - _boxSize;
    Future.delayed(const Duration(milliseconds: 500), _startAnimation);
  }

  @override
  void dispose() {
    _timer.cancel();
    _offsetNotifier.dispose();
    _currentDirNotifier.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000 ~/ 60),
      (_) => _moveBox(),
    );
  }

  void _moveBox() {
    final offset = _offsetNotifier.value;
    final x = offset.dx;
    final y = offset.dy;

    Direction newDirection = _currentDirNotifier.value;
    switch (newDirection) {
      case Direction.tl:
        _offsetNotifier.value =
            Offset(x - _animationSpeed, y - _animationSpeed);
        if (x <= 0) newDirection = Direction.tr;
        if (y <= 0) newDirection = Direction.bl;
        break;
      case Direction.tr:
        _offsetNotifier.value =
            Offset(x + _animationSpeed, y - _animationSpeed);
        if (x >= _maxWidth) newDirection = Direction.tl;
        if (y <= 0) newDirection = Direction.br;
        break;
      case Direction.bl:
        _offsetNotifier.value =
            Offset(x - _animationSpeed, y + _animationSpeed);
        if (x <= 0) newDirection = Direction.br;
        if (y >= _maxHeight) newDirection = Direction.tl;
        break;
      case Direction.br:
        _offsetNotifier.value =
            Offset(x + _animationSpeed, y + _animationSpeed);
        if (x >= _maxWidth) newDirection = Direction.bl;
        if (y >= _maxHeight) newDirection = Direction.tr;
        break;
    }
    _currentDirNotifier.value = newDirection;
  }

  double _getRotationAngle(Direction direction) {
    switch (direction) {
      case Direction.tl:
        return -45 * pi / 180;
      case Direction.tr:
        return 45 * pi / 180;
      case Direction.br:
        return 135 * pi / 180;
      case Direction.bl:
        return 225 * pi / 180;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder<Offset>(
            valueListenable: _offsetNotifier,
            builder: (context, offset, _) {
              return Positioned(
                left: offset.dx,
                top: offset.dy,
                child: ValueListenableBuilder<Direction>(
                  valueListenable: _currentDirNotifier,
                  builder: (context, direction, _) {
                    return Transform.rotate(
                      angle: _getRotationAngle(direction),
                      child: Container(
                        width: _boxSize,
                        height: _boxSize,
                        color: Colors.black,
                        child: const Icon(
                          Icons.airplanemode_on_rounded,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
