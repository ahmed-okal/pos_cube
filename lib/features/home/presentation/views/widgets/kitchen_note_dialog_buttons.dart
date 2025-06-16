import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteDialogButtons extends GetView<KitchenNoteController> {
  const KitchenNoteDialogButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: AppSize.height(33),
            width: AppSize.width(107),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.green,
              ),
            ),
            child: Center(
              child: Text(
                'discard'.tr,
                style: AppTextStyle.green14800,
              ),
            ),
          ),
        ),
        SizedBox(
          width: AppSize.width(7),
        ),
        InkWell(
          onTap: () {
            controller.addKitchenNote(
              controller
                      .orderController
                      .ordersListController
                      .ordersListModel
                      .data?[controller
                          .orderController.ordersListController.order.value]
                      .id
                      .toString() ??
                  '',
              controller
                      .orderController
                      .ordersListController
                      .ordersListModel
                      .data?[controller
                          .orderController.ordersListController.order.value]
                      .orderNo ??
                  '',
              'wait'.tr,
            );
          },
          child: Container(
            height: AppSize.height(33),
            width: AppSize.width(107),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'apply'.tr,
                style: AppTextStyle.white14800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
