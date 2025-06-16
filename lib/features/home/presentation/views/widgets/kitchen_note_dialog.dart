import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_dialog_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteDialog extends GetView<KitchenNoteController> {
  const KitchenNoteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      backgroundColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.height(20),
        horizontal: AppSize.width(20),
      ),
      title: Text(
        'addKitchenNote'.tr,
        style: AppTextStyle.primary18800,
      ),
      content: const KitchenNoteDialogBody(),
    );
  }
}
