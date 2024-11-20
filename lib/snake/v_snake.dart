import 'package:almost_snake/dvd/dvd.dart';
import 'package:almost_snake/loading/_loading_page.dart';
import 'package:almost_snake/snake/c_snake.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnakePage extends StatelessWidget {
  const SnakePage({super.key});

  @override
  Widget build(BuildContext context) {
    SnakeController controller = Get.put(SnakeController());
    double itemWidth = controller.itemWidth;
    Color primary = const Color(0XFFCAF477);
    Color background = const Color(0xFF1E1E1E);
    Color background2 = const Color(0xFF282828);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.width,
                  decoration: BoxDecoration(
                    color: background,
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: controller.top,
                  builder: (context, top, child) {
                    return ValueListenableBuilder(
                      valueListenable: controller.left,
                      builder: (context, left, child) {
                        return Animated_Positioned(
                          top: top,
                          left: left,
                          child: Container(
                            width: itemWidth,
                            height: itemWidth,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapTopLeft();
                          },
                          onLongPressStart: (details) {
                            controller.startContinuousTap();
                          },
                          onLongPressEnd: (details) {
                            controller.stopContinuousTap();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapUp();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.arrow_upward_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapTopRight();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapLeft();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.arrow_back_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapRight();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapDownLeft();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapDown();
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.arrow_downward_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(35),
                          onTap: () {
                            controller.onTapDownRight();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: background2,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const DVDPage());
                      },
                      child: Text("DVD"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => const LoadingPages());
                      },
                      child: Text("Loading"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Animated_Positioned({
    required double top,
    required double left,
    required Widget child,
  }) {
    return AnimatedPositioned(
      top: top,
      left: left,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }
}
