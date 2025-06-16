import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // Reactive dark mode state
  final RxBool _isDarkMode = false.obs;

  ThemeService() {
    // Initialize from storage
    _isDarkMode.value = _loadThemeFromBox();
  }

  /// Get theme mode from storage
  ThemeMode get theme => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  /// Load theme from storage
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  /// Save theme to storage
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Switch theme and save to storage
  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToBox(_isDarkMode.value);
  }

  /// Check if current theme is dark
  bool get isDarkMode => _isDarkMode.value;
}
