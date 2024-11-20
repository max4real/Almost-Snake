import 'package:almost_snake/loading/pulsating_circle.dart';
import 'package:almost_snake/loading/rotating_box.dart';
import 'package:almost_snake/loading/bounce_loading.dart';
import 'package:almost_snake/loading/square_loading.dart';
import 'package:almost_snake/loading/twist_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPages extends StatefulWidget {
  const LoadingPages({super.key});

  @override
  State<LoadingPages> createState() => _LoadingPagesState();
}

class _LoadingPagesState extends State<LoadingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SquareLoading());
            },
            child: Text("Square Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const BounceLoading());
            },
            child: Text("Bounce Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const TwistLoading());
            },
            child: Text("Twist Loading"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const RotatingBox());
            },
            child: Text("Rotating Box"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const PulsatingCircle());
            },
            child: Text("Pulsating Circle"),
          ),
        ],
      ),
    );
  }
}
