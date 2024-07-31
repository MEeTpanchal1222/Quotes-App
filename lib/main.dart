// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quotes DB Miner',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: HomeView(),
    );
  }
}
