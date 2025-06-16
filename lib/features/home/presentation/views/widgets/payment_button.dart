import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(33),
      decoration: BoxDecoration(
        color: AppColors.green,
        border: Border.all(
          color: AppColors.secondry,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          'order'.tr,
          style: AppTextStyle.white18800,
        ),
      ),
    );
  }
}
