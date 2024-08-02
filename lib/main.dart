// // main.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pr_7_db_miner/controllers/theme_controller.dart';
// import 'package:pr_7_db_miner/view/favorites_view.dart';
// import 'package:pr_7_db_miner/view/home_view.dart';
// import 'package:pr_7_db_miner/view/quotes_detail_view.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return GetMaterialApp(
//         title: 'Quotes App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         darkTheme: ThemeData.dark(),
//         themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
//         home: HomeView(),
//         getPages: [
//           GetPage(name: '/', page: () => HomeView()),
//           GetPage(name: '/favorites', page: () => FavoritesView()),
//           GetPage(
//               name: '/quote-detail',
//               page: () => QuoteDetailView(
//                 quote: Get.arguments,
//               )),
//         ],
//       );
//     });
//   }
// }
// main.dart
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
      title: 'Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
