import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteBody extends GetView<KitchenNoteController> {
  const KitchenNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.height(3),
            ),
            Text(
              'note'.tr,
              style: AppTextStyle.primary14600,
            ),
          ],
        ),
        SizedBox(
          width: AppSize.width(8),
        ),
        Expanded(
          child: SizedBox(
            child: TextField(
              controller: controller.waitNote,
              maxLines: 6,
              style: AppTextStyle.primary18800,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondry,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondry,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
