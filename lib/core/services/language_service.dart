import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageService extends GetxController {
  final _box = GetStorage();
  final _key = 'language';

  // Reactive language code state
  final RxString _languageCode = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize from storage on startup
    _languageCode.value = _loadLanguageFromBox();
    // Set initial locale
    updateLocale();
  }

  /// Get saved language code from storage
  String get languageCode => _languageCode.value;

  /// Load language from storage
  String _loadLanguageFromBox() => _box.read(_key) ?? 'en';

  /// Save language to storage
  void saveLanguage(String languageCode) {
    _languageCode.value = languageCode;
    _box.write(_key, languageCode);
  }

  /// Update locale without changing the saved language
  void updateLocale() {
    Get.updateLocale(locale);
  }

  /// Get current locale
  Locale get locale {
    String code = _languageCode.value;
    return code == 'ar' ? const Locale('ar', 'EG') : const Locale('en', 'US');
  }

  /// Change app language
  void changeLanguage(String languageCode) {
    Locale locale = languageCode == 'ar'
        ? const Locale('ar', 'EG')
        : const Locale('en', 'US');
    saveLanguage(languageCode);
    Get.updateLocale(locale);
  }
}
