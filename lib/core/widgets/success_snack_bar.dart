import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/size_config.dart';

successSnackBar(String message) {
  return Get.snackbar(
    '',
    '',
    maxWidth: AppSize.width(312),
    titleText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.width(10),
        end: AppSize.width(10),
      ),
      child: Text(
        'done'.tr,
        style: AppTextStyle.white14700,
      ),
    ),
    messageText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.width(10),
        end: AppSize.width(10),
      ),
      child: Text(
        message,
        style: AppTextStyle.white10600,
      ),
    ),
    backgroundColor: AppColors.green,
    icon: Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.height(16),
        horizontal: AppSize.width(10),
      ),
      child: Icon(
        Icons.check_circle,
        color: AppColors.white,
        size: AppSize.height(24),
      ),
    ),
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
  );
}
