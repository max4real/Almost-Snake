import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnakeController extends GetxController {
  double itemWidth = Get.width * 0.1;
  ValueNotifier<double> top = ValueNotifier(0);
  ValueNotifier<double> left = ValueNotifier(0);

  void onTapUp() {
    top.value = max(0, top.value - itemWidth);
  }

  void onTapDown() {
    top.value = min(Get.width - itemWidth, top.value + itemWidth);
  }

  void onTapRight() {
    left.value = min(Get.width - itemWidth, left.value + itemWidth);
  }

  void onTapLeft() {
    left.value = max(0, left.value - itemWidth);
  }

  void onTapTopLeft() {
    onTapLeft();
    onTapUp();
  }

  void onTapTopRight() {
    onTapRight();
    onTapUp();
  }

  void onTapDownLeft() {
    onTapLeft();
    onTapDown();
  }

  void onTapDownRight() {
    onTapRight();
    onTapDown();
  }
}
