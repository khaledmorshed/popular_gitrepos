import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/local/sharepreferences_class.dart';
import '../utils/app_constants.dart';

class ThemeController extends GetxController implements GetxService {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPrefs(); // Load theme from SharedPreferences on initialization
  }

  Future<void> toggleTheme(bool isOn)async {
    print("isON...$isOn");
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    // Save the new theme mode in SharedPreferences
    await SharedPreferencesClass.setBoolValue(SharedPreferencesClass.themeKey, isOn);
    update();
  }

  // Load the theme mode from SharedPreferences
  Future<void> _loadThemeFromPrefs() async {
    bool? isDarkMode = await SharedPreferencesClass.getBoolValue(SharedPreferencesClass.themeKey);
    if (isDarkMode != null) {
      themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      themeMode = ThemeMode.light; // Default to light mode if not set
    }
    update();
  }
}
