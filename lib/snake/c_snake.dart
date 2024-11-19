import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnakeController extends GetxController {
  double itemWidth = Get.width * 0.1;
  ValueNotifier<double> top = ValueNotifier(0);
  ValueNotifier<double> left = ValueNotifier(0);

  void onTapUp() async {
    if (top.value == 0) {
      double value = itemWidth * 2;
      while (Get.width - value >= top.value) {
        top.value = min(Get.width - itemWidth, top.value + itemWidth);
        await Future.delayed(const Duration(milliseconds: 200));
      }
      onTapDown();
    } else {
      top.value = max(0, top.value - itemWidth);
    }
  }

  void onTapDown() async {
    if (top.value == Get.width - itemWidth) {
      while (0 < top.value) {
        top.value = max(0, top.value - itemWidth);
        await Future.delayed(const Duration(milliseconds: 200));
      }
      onTapUp();
    } else {
      top.value = min(Get.width - itemWidth, top.value + itemWidth);
    }
  }

  void onTapRight() async {
    if (left.value == Get.width - itemWidth) {
      while (0 < left.value) {
        left.value = max(0, left.value - itemWidth);
        await Future.delayed(const Duration(milliseconds: 200));
      }
      onTapLeft();
    } else {
      left.value = min(Get.width - itemWidth, left.value + itemWidth);
    }
  }

  void onTapLeft() async {
    if (left.value == 0) {
      double value = itemWidth * 2;
      while (Get.width - value >= left.value) {
        left.value = min(Get.width - itemWidth, left.value + itemWidth);
        await Future.delayed(const Duration(milliseconds: 200));
      }
      onTapRight();
    } else {
      left.value = max(0, left.value - itemWidth);
    }
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

  Timer? _tapTimer;

  void startContinuousTap() {
    _tapTimer = Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        onTapTopLeft();
      },
    );
  }

  void stopContinuousTap() {
    _tapTimer?.cancel();
    _tapTimer = null;
  }
}
