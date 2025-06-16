import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/language_service.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/size_config.dart';

class LanguageDropDownButton extends StatelessWidget {
  final LanguageService _languageService = Get.find<LanguageService>();

  LanguageDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Obx(() => DropdownButton<String>(
            value: _languageService.languageCode,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primaryColor,
              size: AppSize.height(24),
            ),
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                value: 'ar',
                child: Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: AppColors.primaryColor,
                      size: AppSize.height(19),
                    ),
                    SizedBox(width: AppSize.width(5)),
                    Text('العربية', style: AppTextStyle.primary14800),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: AppColors.primaryColor,
                      size: AppSize.height(19),
                    ),
                    SizedBox(width: AppSize.width(5)),
                    Text('EN', style: AppTextStyle.primary14800),
                  ],
                ),
              ),
            ],
            onChanged: (String? newLang) {
              if (newLang != null) {
                _languageService.changeLanguage(newLang);
              }
            },
          )),
    );
  }
}
