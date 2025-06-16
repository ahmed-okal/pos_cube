import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/theme_service.dart';
import '../utils/app_colors.dart';
import '../utils/size_config.dart';

class ThemeToggleButton extends StatelessWidget {
  final ThemeService _themeService = Get.find<ThemeService>();

  ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(() => Icon(
            _themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: AppColors.primaryColor,
            size: AppSize.height(24),
          )),
      onPressed: () {
        _themeService.switchTheme();
      },
    );
  }
}
