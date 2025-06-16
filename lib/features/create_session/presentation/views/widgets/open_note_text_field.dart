import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/create_session_controller.dart';

class OpenNoteTextField extends GetView<CreateSessionController> {
  const OpenNoteTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.openSessionController.openNotesController,
      maxLines: 7,
      style: AppTextStyle.primary20700,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondry,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondry,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.secondry,
          ),
        ),
        hintText: 'addNote'.tr,
        hintStyle: AppTextStyle.primary20600,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSize.width(20),
          vertical: AppSize.height(8),
        ),
      ),
    );
  }
}
