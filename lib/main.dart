// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/home_view.dart';
import 'controllers/theme_controller.dart';

void main() {
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Quotes DB Miner',
        theme: themeController.isDarkMode.value ? ThemeData.dark() : ThemeData.light(),
        home: HomeView(),
      );
    });
  }
}
