import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';
import 'kitchen_note_dialog.dart';

class KitchenNoteButton extends GetView<CategoriesController> {
  const KitchenNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const KitchenNoteDialog();
            },
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: AppSize.height(33),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.secondry,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'kitchenNote'.tr,
              style: controller.orderController.selectedIndex.value != -1 &&
                      Get.locale == const Locale('ar', 'EG')
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
        ),
      ),
    );
  }
}
