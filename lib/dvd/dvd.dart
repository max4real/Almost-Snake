import 'dart:async';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Direction { tl, tr, bl, br }

class DVDPage extends StatefulWidget {
  const DVDPage({super.key});

  @override
  State<DVDPage> createState() => _DVDPageState();
}

class _DVDPageState extends State<DVDPage> {
  ValueNotifier<Offset> offset =
      ValueNotifier(Offset(Get.width / 3, Get.height / 2));
  Timer timer = Timer(Duration.zero, () {});
  double maxWidth = Get.width - 80;
  double maxHeight = Get.height - 50;
  double minWidth = 0;
  double minHeight = 0;
  double animationSpeed = 3;
  ValueNotifier<Direction> currentDir = ValueNotifier(Direction.tr);

  void move() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1000 ~/ 60),
      (timer) {
        final x = offset.value.dx;
        final y = offset.value.dy;
        switch (currentDir.value) {
          case Direction.tl:
            offset.value = Offset(x - animationSpeed, y - animationSpeed);
            if (x <= minWidth) {
              currentDir.value = Direction.tr;
            } else if (y <= minHeight) {
              currentDir.value = Direction.bl;
            }
            break;
          case Direction.tr:
            offset.value = Offset(x + animationSpeed, y - animationSpeed);
            if (x >= maxWidth) {
              currentDir.value = Direction.tl;
            } else if (y <= minHeight) {
              currentDir.value = Direction.br;
            }
            break;
          case Direction.bl:
            offset.value = Offset(x - animationSpeed, y + animationSpeed);
            if (x <= minWidth) {
              currentDir.value = Direction.br;
            } else if (y >= maxHeight) {
              currentDir.value = Direction.tl;
            }
            break;
          case Direction.br:
            offset.value = Offset(x + animationSpeed, y + animationSpeed);
            if (x >= maxWidth) {
              currentDir.value = Direction.bl;
            } else if (y >= maxHeight) {
              currentDir.value = Direction.tr;
            }
            break;
        }
      },
    );
  }

  double getDirection(Direction currentDir) {
    //45 135 225 315
    switch (currentDir) {
      case Direction.tl:
        return -45;
      case Direction.tr:
        return 45;
      case Direction.br:
        return 135;
      case Direction.bl:
        return 225;
      default:
        throw Exception('Unknown direction: $currentDir');
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) => move());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: offset,
            builder: (context, offset, child) {
              return Positioned(
                left: offset.dx,
                top: offset.dy,
                child: Image.network(
                  "https://w7.pngwing.com/pngs/981/433/png-transparent-dvd-video-logo-dvd-text-sign-symbol-thumbnail.png",
                  width: 80,
                  height: 50,
                ),
                // child: ValueListenableBuilder(
                //   valueListenable: currentDir,
                //   builder: (context, currentDir, child) {
                //     return Transform.rotate(
                //       angle: getDirection(currentDir) * pi / 180,
                //       child: const Icon(
                //         Icons.airplanemode_on_rounded,
                //         color: Colors.black,
                //         size: 50,
                //       ),
                //     );
                //   },
                // ),
              );
            },
          ),
        ],
      ),
    );
  }
}
