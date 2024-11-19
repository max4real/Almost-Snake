import 'package:almost_snake/dvd/dvd.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: SnakePage(),
      // home: ExplicitAnimationExample(),
      home: DVDPage(),
    );
  }
}
