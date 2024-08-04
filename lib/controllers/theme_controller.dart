import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  RxString selectedImage = 'assets/image4.jpeg'.obs; // Initialize with an empty string

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode(prefs.getBool('isDarkMode') ?? false);
  }

  void toggleTheme() async {
    isDarkMode(!isDarkMode.value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void setImage(String imagePath) {
    selectedImage.value = imagePath;
  }
}