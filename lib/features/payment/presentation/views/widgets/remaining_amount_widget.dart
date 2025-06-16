// widgets/remaining_amount_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/payment_controller.dart';

class RemainingAmountWidget extends GetView<PaymentController> {
  const RemainingAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Force recalculation of remaining amount
      final remaining = controller.remaining;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.grey1, width: 2),
          color: AppColors.white,
        ),
        height: AppSize.height(55),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(16),
          vertical: AppSize.height(9),
        ),
        child: Row(
          children: [
            Text(
              "remaining".tr,
              style: AppTextStyle.primary20800,
            ),
            const Spacer(),
            Text(
              "${remaining.toStringAsFixed(2)} ${'SR'.tr}",
              style: AppTextStyle.primary20800,
            ),
          ],
        ),
      );
    });
  }
}
