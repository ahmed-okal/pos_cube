import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/size_config.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../getx/controllers/close_session_controller.dart';

class CloseNotesTextField extends GetView<CloseSessionController> {
  const CloseNotesTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.closeNotes,
      maxLines: 4,
      maxLength: 300,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.secondry,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.secondry,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryWithOpacity,
          ),
        ),
        // hintText: 'addNote'.tr,
        contentPadding: EdgeInsets.all(AppSize.height(12)),
      ),
    );
  }
}
