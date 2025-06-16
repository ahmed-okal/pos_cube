import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/size_config.dart';

failedSnaskBar(String errorMessage) {
  Get.snackbar(
    '',
    '',
    maxWidth: AppSize.width(312),
    titleText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.width(10),
        end: AppSize.width(10),
      ),
      child: Text(
        'error'.tr,
        style: AppTextStyle.white20800,
      ),
    ),
    messageText: Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.width(10),
        end: AppSize.width(10),
      ),
      child: Text(
        errorMessage,
        style: AppTextStyle.white10800,
      ),
    ),
    backgroundColor: AppColors.secondaryColor,
    icon: Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.height(16),
        horizontal: AppSize.width(10),
      ),
      child: Icon(
        Icons.cancel_rounded,
        color: AppColors.white,
        size: AppSize.height(24),
      ),
    ),
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
  );
}
