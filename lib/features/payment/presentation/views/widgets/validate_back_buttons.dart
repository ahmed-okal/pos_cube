import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../getx/controllers/payment_controller.dart';

class ValidateAndBackButtons extends GetView<PaymentController> {
  const ValidateAndBackButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: Get.back,
            child: Container(
              height: AppSize.height(39),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.grey1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'back'.tr,
                  style: AppTextStyle.primary20800,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: AppSize.width(16),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              if (controller.selectedMethodIndex.value < 0) {
                failedSnaskBar('Please select a payment method first');
              } else if (controller.remaining == 0.0) {
                controller.validatePayment();
              } else {
                failedSnaskBar('pleasePayTheAmount'.tr);
              }
            },
            child: Obx(
              () => Container(
                height: AppSize.height(39),
                decoration: BoxDecoration(
                  color: controller.selectedMethodIndex.value < 0
                      ? AppColors.grey2
                      : controller.remaining == 0.0
                          ? AppColors.green
                          : AppColors.grey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'validate'.tr,
                    style: AppTextStyle.primary20800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
