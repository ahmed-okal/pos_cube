// widgets/total_amount_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/payment_controller.dart';

class TotalAmountWidget extends GetView<PaymentController> {
  const TotalAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(80),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryWithOpacity,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.shouldPaidAmount,
              style: AppTextStyle.primary40800,
            ),
            Text(
              'SR'.tr,
              style: AppTextStyle.primary40800,
            ),
          ],
        ),
      ),
    );
  }
}
