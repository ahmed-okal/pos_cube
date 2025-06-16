import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class CustomersDialogButtons extends GetView<CustomersController> {
  const CustomersDialogButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            controller.selectedCustomerId.value = null;
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
            Get.back();
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
                'confirm'.tr,
                style: AppTextStyle.white14800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
