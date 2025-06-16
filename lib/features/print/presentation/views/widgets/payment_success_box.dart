import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

import '../../../../../core/utils/size_config.dart';

class PaymentSuccessBox extends GetView<PrintController> {
  const PaymentSuccessBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(170),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.seafoamBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.white,
            size: getSize(100),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${controller.totalPrice + (controller.totalPrice * double.parse(controller.loginController.loginTaskModel.data?.company?[0].settings?.invoice?[14].value ?? '0') / 100)} ${'SR'.tr}',
                style: AppTextStyle.white48800,
              ),
              Text(
                'paymentSuccess'.tr,
                style: AppTextStyle.white20800,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
